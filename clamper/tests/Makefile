TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)
COCOTB=$(PWD)/../../cocotb

VERILOG_SOURCES = $(PWD)/../hdl/Clamper.v

TOPLEVEL := Clamper
MODULE   := test_clamper

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim
