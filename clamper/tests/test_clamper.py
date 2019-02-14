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

    out = list(toCL(out))
    res = list(toCL(res))

    def roll( num, den):
        return random.randrange(den) < num

#
# Reverse lists so pop() will be efficent
#
    out.reverse()
    res.reverse()

    cocotb.fork( clock_gen(dut.clock))

    clkedge = RisingEdge(dut.clock)

    dut.reset = 1
    dut.io_start = 0

    yield clkedge

    dut.reset = 0
    dut.io_start = 1

    out_valid = False
    res_ready = False

    f_out = False
    f_res = False

    max_cycles = 2000
    num = 32
    den = 4

    cycles = 0
    res_idx = 0
    while len(res) > 0 and cycles < max_cycles:
        # pokes
        p_out_valid = roll(num, den) and len(out) > 0
        out_valid = out_valid and not f_out or p_out_valid
        dut.io_out_valid = 1 if out_valid else 0
        if out_valid:
            for (i,v) in enumerate(out[-1]):
                setattr( dut, "io_out_bits_%d" % i, v)

        p_res_ready = roll(num, den)
        res_ready = res_ready and not f_res or p_res_ready
        dut.io_res_ready = 1 if res_ready else 0

        yield ReadOnly()

        # peeks
        f_out = dut.io_out_ready != 0 and out_valid
        if f_out:
            out.pop()

        f_res = dut.io_res_valid != 0 and res_ready
        if f_res:
            r = res.pop()
            for (i,x) in enumerate(r):
                v = getattr( dut, "io_res_bits_%d" % i)
                if int(v) != x:
                    raise TestFailure("result is incorrect: res[%d][%d](%d) != %d" % ( res_idx, i, x, v))
            res_idx += 1

        yield clkedge
        cycles += 1
        
    if len(res) > 0:
        raise TestFailure("Result stream not fully consumed after %d cycles. %d items remaining" % (max_cycles,len(res)))
