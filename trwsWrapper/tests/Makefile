SIM ?= vcs
TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)
COCOTB=$(PWD)/../../cocotb

VERILOG_SOURCES = $(PWD)/../hdl/trwsWrapper.v

TOPLEVEL := trwsWrapper
MODULE   := test_trwsWrapper

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim
