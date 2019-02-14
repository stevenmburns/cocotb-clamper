# Simple tests for an adder module
import cocotb
from cocotb.triggers import Timer, RisingEdge, ReadOnly
from cocotb.result import TestFailure
import random

@cocotb.coroutine
def clock_gen(signal):
    while True:
        signal <= 0
        yield Timer(500) # ps
        signal <= 1
        yield Timer(500) # ps


class Adapter:
    def __init__(self, num, den):
        self.num = num
        self.den = den

    def roll(self):
        return random.randrange(self.den) < self.num

class OutAdapter(Adapter):
    def __init__(self, dut, port, seq, *, num=3, den=4):
        self.dut = dut
        self.port = port
        self.reversed = list(seq)
        self.reversed.reverse()
        self.idx = 0
        self.ready = False
        self.fired = False
        super().__init__( num, den)

    def do_poke(self):
        p = self.roll()
        self.ready = self.ready and not self.fired or p
        setattr( self.dut, self.port + '_ready', 1 if self.ready else 0)
        
    def do_peek(self):
        self.fired = getattr(self.dut, self.port + '_valid') != 0 and self.ready
        if self.fired:
            for (i,x) in enumerate(self.reversed.pop()):
                v = getattr( self.dut, self.port + ("_bits_%d" % i))
                if int(v) != x:
                    raise TestFailure("result is incorrect: %s[%d][%d](%d) != %d" % ( self.port, self.idx, i, x, v))
            self.idx += 1

    def done(self):
        return len(self.reversed) > 0

class InAdapter(Adapter):
    def __init__(self, dut, port, seq, *, num=3, den=4):
        self.dut = dut
        self.port = port
        self.reversed = list(seq)
        self.reversed.reverse()
        self.valid = False
        self.fired = False
        super().__init__( num, den)

    def do_poke(self):
        p = self.roll() and len(self.reversed) > 0
        self.valid = self.valid and not self.fired or p
        setattr( self.dut, self.port + '_valid', 1 if self.valid else 0)
        if self.valid:
            for (i,v) in enumerate(self.reversed[-1]):
                setattr( self.dut, self.port + ("_bits_%d" % i), v)
        
    def do_peek(self):
        self.fired = getattr(self.dut, self.port + '_ready') != 0 and self.valid
        if self.fired:
            self.reversed.pop()

    def done(self):
        return len(self.reversed) > 0

class AdapterManager:
    def __init__( self):
        self.adapters = []
    def add(self, adapter):
        self.adapters.append(adapter)

    def do_peeks(self):
        for adapter in self.adapters:
            adapter.do_peek()

    def do_pokes(self):
        for adapter in self.adapters:
            adapter.do_pokes()

    def done(self):
        return all(adapter.done() for adapter in self.adapters)


@cocotb.test()
def basic_test(dut):
    cl_per_row = 3
    elems_per_cl = 8
    
    n = cl_per_row*elems_per_cl
    n_slices = n*(n-1)//2

    out = [ [ random.randrange( 1<<13) - (1<<12) for i in range(n)] for j in range(n_slices)]

    res = []
    for v in out:
        best = min(v)
        res.append( [ x - best for x in v])

#
# Convert from n_slices*(cl_per_row*elems_per_cl) to (n_slices*cl_per_row)*elems_per_cl
#
    def toCL( lstOfLsts):
        for lst in lstOfLsts:
            for i in range(cl_per_row):
                yield lst[i*elems_per_cl:(i+1)*elems_per_cl]

    mgr = AdapterManager()
    mgr.add( InAdapter( dut, 'io_out', toCL(out)))
    mgr.add( OutAdapter( dut, 'io_res', toCL(res)))

    cocotb.fork( clock_gen(dut.clock))

    clkedge = RisingEdge(dut.clock)

    dut.reset = 1
    dut.io_start = 0

    yield clkedge

    dut.reset = 0
    dut.io_start = 1

    max_cycles = 2000
    cycles = 0
    while not mgr.done() and cycles < max_cycles:
        mgr.do_pokes()
        yield ReadOnly()

        mgr.do_peeks()
        yield clkedge
        cycles += 1
        
    if not mgr.done():
        raise TestFailure("Streams not fully consumed after %d cycles." % max_cycles)
