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
        return len(self.reversed) == 0

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
        return len(self.reversed) == 0

class InBundleAdapter(Adapter):
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
            for (k,v) in self.reversed[-1].items():
                setattr( self.dut, self.port + ("_bits_%s" % k), v)
        
    def do_peek(self):
        self.fired = getattr(self.dut, self.port + '_ready') != 0 and self.valid
        if self.fired:
            self.reversed.pop()

    def done(self):
        return len(self.reversed) == 0

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
            adapter.do_poke()

    def done(self):
        return all(adapter.done() for adapter in self.adapters)


@cocotb.test()
def basic_test(dut):
    cl_per_row = 3
    elems_per_cl = 32
    
    precision = 8
    radixPoint = 10

    n = cl_per_row*elems_per_cl
    n_slices = n*(n-1)//2

    SLC = [ { "a": random.randrange( 1<<precision), "e": random.randrange( 1<<precision)}
            for i in range(n*n)]

    LOF = [ { "a": random.randrange( 1<<precision), "e": random.randrange( 1<<precision)}
            for i in range(n_slices)]

    GI = [ [ random.randrange( 1<<precision) for j in range(n)] ]
    WI = [ [ random.randrange( 1<<precision) - (1<<(precision-1)) for j in range(n)]
           for i in range(n-1)]
    MI = [ [ random.randrange( 1<<precision) for j in range(n)] for i in range(n_slices)]

    
    OFF = [ [ 0 for j in range(n)] for i in range(n_slices)]
    OUT = [ [ 0 for j in range(n)] for i in range(n_slices)]
    RES = [ [ 0 for j in range(n)] for i in range(n_slices)]

    def computeOUT( islice, j):
        b = LOF[islice]["a"]
        f = LOF[islice]["e"]
        best = 0
        for i in range(n):
            a = SLC[i*n+j]["a"]
            e = SLC[i*n+j]["e"]
            o = OFF[islice][i]
            mx = f if ( e < f) else e
            ab = b-a if ( a < b) else a-b
            lmt = 204
            mn = ab if ( ab < lmt) else lmt
            cand = (( mx * mn ) >> radixPoint) + o
            if i == 0 or cand < best:
                best = cand

        print( "islice: %d j: %d best: %d" % (islice,j,best))
        return best

    def computeRES( islice):
        v = OUT[islice]
        for (i,x) in enumerate(v):
            if i == 0 or x < best:
                best = x
        return [ x - best for x in v]


    def loops():
        def index( s, t):
            return t*n-t*(t+1)//2 + s-(t+1)

        for t in range(n-1):
            weights = WI[t][:]

            # Forward
            for s in range(t+1,n):
                k = index(s, t)
                for j in range(n):
                    weights[j] += MI[k][j]
            # Backward
            for s in range(t):
                k = index(t, s)
                for j in range(n):
                    weights[j] += RES[k][j]

            # Gen OFF
            for s in range(t+1, n):
                k = index(s, t)
                for j in range(n):
                    OFF[k][j] = ((GI[0][s]*weights[j])>>radixPoint) - MI[k][j]

                for j in range(n):
                    OUT[k][j] = computeOUT(k, j)

                res = computeRES( k)

                for j in range(n):
                    RES[k][j] = res[j]

    loops()

    MO = RES

#
# Convert from n_slices*(cl_per_row*elems_per_cl) to (n_slices*cl_per_row)*elems_per_cl
#
    def toCL( lstOfLsts):
        for lst in lstOfLsts:
            for i in range(cl_per_row):
                yield lst[i*elems_per_cl:(i+1)*elems_per_cl]

    cocotb.fork( clock_gen(dut.clock))
    clkedge = RisingEdge(dut.clock)

    for (modeLoad, modeCompute, loadIdx, computeIdx) in [(True, False, 0, 0),  (False, True, 0, 0)]:
        print("New run")

        dut.reset = 1
        dut.io_start = 0

        dut.io_modeLoad = 1 if modeLoad else 0
        dut.io_modeCompute = 1 if modeCompute else 0
        dut.io_loadIdx = loadIdx
        dut.io_computeIdx = computeIdx

        dut.io_slc_valid = 0
        dut.io_lof_valid = 0
        dut.io_gi_valid = 0
        dut.io_wi_valid = 0
        dut.io_mi_valid = 0
        dut.io_mo_ready = 0

        yield ReadOnly()
        for i in range(20):
            yield clkedge

        dut.reset = 0
        dut.io_start = 1

        mgr = AdapterManager()


        if modeLoad:
            mgr.add( InBundleAdapter( dut, 'io_slc', SLC))
            
        if modeCompute:
            mgr.add( InBundleAdapter( dut, 'io_lof', LOF))
            mgr.add( InAdapter( dut, 'io_gi', toCL(GI)))
            mgr.add( InAdapter( dut, 'io_wi', toCL(WI)))
            mgr.add( InAdapter( dut, 'io_mi', toCL(MI)))
            mgr.add( OutAdapter( dut, 'io_mo', toCL(MO)))

        max_cycles = 100000000
        cycles = 0

        while int(dut.io_done) == 0 and cycles < max_cycles:
            mgr.do_pokes()
            yield ReadOnly()

            mgr.do_peeks()
            yield clkedge
            cycles += 1
        
        if not mgr.done():
            raise TestFailure("Streams not fully consumed after %d cycles." % max_cycles)

