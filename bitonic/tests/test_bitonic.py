import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure
from random import sample

@cocotb.test()
def bitonic_basic_test(dut):
    for i in range(10000):
        perm = sample(range(256), 64)

        for i in range(len(perm)):
            setattr( dut, "io_a_%d" % i, perm[i])

        yield Timer(1)

        for (i,x) in enumerate(sorted(perm)):
            v = getattr( dut, "io_z_%d" % i)
            if int(v) != x:
                raise TestFailure("Sort result is incorrect: s[%d]=%d != %d" % (i,v,x))


