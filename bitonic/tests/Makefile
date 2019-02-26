
TOPLEVEL_LANG ?= verilog
SIM ?= vcs

PWD=$(shell pwd)
COCOTB=$(PWD)/../../cocotb

VERILOG_SOURCES = $(PWD)/../hdl/BitonicSorterModule.v

TOPLEVEL := BitonicSorterModule
MODULE   := test_bitonic 

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim
