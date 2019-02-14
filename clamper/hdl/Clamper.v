module SplitOut(
  input         io_start,
  output        io_out_ready,
  input         io_out_valid,
  input  [15:0] io_out_bits_0,
  input  [15:0] io_out_bits_1,
  input  [15:0] io_out_bits_2,
  input  [15:0] io_out_bits_3,
  input  [15:0] io_out_bits_4,
  input  [15:0] io_out_bits_5,
  input  [15:0] io_out_bits_6,
  input  [15:0] io_out_bits_7,
  input         io_out0_ready,
  output        io_out0_valid,
  output [15:0] io_out0_bits_0,
  output [15:0] io_out0_bits_1,
  output [15:0] io_out0_bits_2,
  output [15:0] io_out0_bits_3,
  output [15:0] io_out0_bits_4,
  output [15:0] io_out0_bits_5,
  output [15:0] io_out0_bits_6,
  output [15:0] io_out0_bits_7,
  input         io_out1_ready,
  output        io_out1_valid,
  output [15:0] io_out1_bits_0,
  output [15:0] io_out1_bits_1,
  output [15:0] io_out1_bits_2,
  output [15:0] io_out1_bits_3,
  output [15:0] io_out1_bits_4,
  output [15:0] io_out1_bits_5,
  output [15:0] io_out1_bits_6,
  output [15:0] io_out1_bits_7
);
  wire  _T; // @[Clamper.scala 23:25]
  wire  _T_1; // @[Clamper.scala 23:42]
  assign _T = io_out_valid & io_out0_ready; // @[Clamper.scala 23:25]
  assign _T_1 = _T & io_out1_ready; // @[Clamper.scala 23:42]
  assign io_out_ready = io_start ? _T_1 : 1'h0; // @[Decoupled.scala 69:20 Clamper.scala 24:20]
  assign io_out0_valid = io_start ? _T_1 : 1'h0; // @[Decoupled.scala 53:20 Clamper.scala 25:21]
  assign io_out0_bits_0 = io_out_bits_0; // @[Clamper.scala 27:20]
  assign io_out0_bits_1 = io_out_bits_1; // @[Clamper.scala 27:20]
  assign io_out0_bits_2 = io_out_bits_2; // @[Clamper.scala 27:20]
  assign io_out0_bits_3 = io_out_bits_3; // @[Clamper.scala 27:20]
  assign io_out0_bits_4 = io_out_bits_4; // @[Clamper.scala 27:20]
  assign io_out0_bits_5 = io_out_bits_5; // @[Clamper.scala 27:20]
  assign io_out0_bits_6 = io_out_bits_6; // @[Clamper.scala 27:20]
  assign io_out0_bits_7 = io_out_bits_7; // @[Clamper.scala 27:20]
  assign io_out1_valid = io_start ? _T_1 : 1'h0; // @[Decoupled.scala 53:20 Clamper.scala 26:21]
  assign io_out1_bits_0 = io_out_bits_0; // @[Clamper.scala 28:20]
  assign io_out1_bits_1 = io_out_bits_1; // @[Clamper.scala 28:20]
  assign io_out1_bits_2 = io_out_bits_2; // @[Clamper.scala 28:20]
  assign io_out1_bits_3 = io_out_bits_3; // @[Clamper.scala 28:20]
  assign io_out1_bits_4 = io_out_bits_4; // @[Clamper.scala 28:20]
  assign io_out1_bits_5 = io_out_bits_5; // @[Clamper.scala 28:20]
  assign io_out1_bits_6 = io_out_bits_6; // @[Clamper.scala 28:20]
  assign io_out1_bits_7 = io_out_bits_7; // @[Clamper.scala 28:20]
endmodule
module ComputeBest(
  input         clock,
  input         reset,
  input         io_start,
  output        io_out0_ready,
  input         io_out0_valid,
  input  [15:0] io_out0_bits_0,
  input  [15:0] io_out0_bits_1,
  input  [15:0] io_out0_bits_2,
  input  [15:0] io_out0_bits_3,
  input  [15:0] io_out0_bits_4,
  input  [15:0] io_out0_bits_5,
  input  [15:0] io_out0_bits_6,
  input  [15:0] io_out0_bits_7,
  input         io_obest_ready,
  output        io_obest_valid,
  output [15:0] io_obest_bits
);
  reg [1:0] jj; // @[Clamper.scala 42:19]
  reg [31:0] _RAND_0;
  reg [15:0] best; // @[Clamper.scala 43:17]
  reg [31:0] _RAND_1;
  reg  validPipe0; // @[Clamper.scala 63:27]
  reg [31:0] _RAND_2;
  reg [1:0] prev_jj0; // @[Clamper.scala 64:25]
  reg [31:0] _RAND_3;
  reg [15:0] m0_0; // @[Clamper.scala 65:15]
  reg [31:0] _RAND_4;
  reg [15:0] m0_1; // @[Clamper.scala 65:15]
  reg [31:0] _RAND_5;
  reg [15:0] m0_2; // @[Clamper.scala 65:15]
  reg [31:0] _RAND_6;
  reg [15:0] m0_3; // @[Clamper.scala 65:15]
  reg [31:0] _RAND_7;
  reg  validPipe1; // @[Clamper.scala 67:27]
  reg [31:0] _RAND_8;
  reg [1:0] prev_jj1; // @[Clamper.scala 68:25]
  reg [31:0] _RAND_9;
  reg [15:0] m1_0; // @[Clamper.scala 69:15]
  reg [31:0] _RAND_10;
  reg [15:0] m1_1; // @[Clamper.scala 69:15]
  reg [31:0] _RAND_11;
  wire  _T_1; // @[Clamper.scala 90:37]
  wire  _T_2; // @[Clamper.scala 90:58]
  wire  _T_3; // @[Clamper.scala 90:23]
  wire  _T_5; // @[Clamper.scala 73:22]
  wire [15:0] _GEN_0; // @[Clamper.scala 73:27]
  wire  _T_7; // @[Clamper.scala 95:53]
  wire  _T_9; // @[Clamper.scala 73:22]
  wire  _T_10; // @[Clamper.scala 73:17]
  wire  _T_11; // @[Clamper.scala 100:23]
  wire  _GEN_5; // @[Clamper.scala 90:78]
  wire  _GEN_7; // @[Clamper.scala 90:78]
  wire  _T_13; // @[Clamper.scala 110:26]
  wire  _T_14; // @[Clamper.scala 110:23]
  wire  _T_16; // @[Clamper.scala 73:22]
  wire  _T_19; // @[Clamper.scala 73:22]
  wire  _GEN_14; // @[Clamper.scala 110:43]
  wire  _T_21; // @[Clamper.scala 129:29]
  wire  _T_22; // @[Clamper.scala 129:26]
  wire  _T_24; // @[Clamper.scala 73:22]
  wire  _T_27; // @[Clamper.scala 73:22]
  wire  _T_30; // @[Clamper.scala 73:22]
  wire  _T_33; // @[Clamper.scala 73:22]
  wire  _T_35; // @[Clamper.scala 145:17]
  wire [1:0] _T_37; // @[Clamper.scala 146:18]
  assign _T_1 = prev_jj1 != 2'h2; // @[Clamper.scala 90:37]
  assign _T_2 = _T_1 | io_obest_ready; // @[Clamper.scala 90:58]
  assign _T_3 = validPipe1 & _T_2; // @[Clamper.scala 90:23]
  assign _T_5 = $signed(m1_0) < $signed(m1_1); // @[Clamper.scala 73:22]
  assign _GEN_0 = _T_5 ? $signed(m1_0) : $signed(m1_1); // @[Clamper.scala 73:27]
  assign _T_7 = prev_jj1 == 2'h0; // @[Clamper.scala 95:53]
  assign _T_9 = $signed(_GEN_0) < $signed(best); // @[Clamper.scala 73:22]
  assign _T_10 = _T_7 | _T_9; // @[Clamper.scala 73:17]
  assign _T_11 = prev_jj1 == 2'h2; // @[Clamper.scala 100:23]
  assign _GEN_5 = _T_3 ? _T_11 : 1'h0; // @[Clamper.scala 90:78]
  assign _GEN_7 = _T_3 ? 1'h0 : validPipe1; // @[Clamper.scala 90:78]
  assign _T_13 = _GEN_7 == 1'h0; // @[Clamper.scala 110:26]
  assign _T_14 = validPipe0 & _T_13; // @[Clamper.scala 110:23]
  assign _T_16 = $signed(m0_0) < $signed(m0_1); // @[Clamper.scala 73:22]
  assign _T_19 = $signed(m0_2) < $signed(m0_3); // @[Clamper.scala 73:22]
  assign _GEN_14 = _T_14 ? 1'h0 : validPipe0; // @[Clamper.scala 110:43]
  assign _T_21 = _GEN_14 == 1'h0; // @[Clamper.scala 129:29]
  assign _T_22 = io_out0_valid & _T_21; // @[Clamper.scala 129:26]
  assign _T_24 = $signed(io_out0_bits_0) < $signed(io_out0_bits_1); // @[Clamper.scala 73:22]
  assign _T_27 = $signed(io_out0_bits_2) < $signed(io_out0_bits_3); // @[Clamper.scala 73:22]
  assign _T_30 = $signed(io_out0_bits_4) < $signed(io_out0_bits_5); // @[Clamper.scala 73:22]
  assign _T_33 = $signed(io_out0_bits_6) < $signed(io_out0_bits_7); // @[Clamper.scala 73:22]
  assign _T_35 = jj != 2'h2; // @[Clamper.scala 145:17]
  assign _T_37 = jj + 2'h1; // @[Clamper.scala 146:18]
  assign io_out0_ready = io_start ? _T_22 : 1'h0; // @[Decoupled.scala 69:20 Clamper.scala 130:21]
  assign io_obest_valid = io_start ? _GEN_5 : 1'h0; // @[Decoupled.scala 53:20 Clamper.scala 101:24]
  assign io_obest_bits = _T_10 ? $signed(_GEN_0) : $signed(best); // @[Clamper.scala 102:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  jj = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  best = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  validPipe0 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  prev_jj0 = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  m0_0 = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  m0_1 = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  m0_2 = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  m0_3 = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  validPipe1 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  prev_jj1 = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  m1_0 = _RAND_10[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  m1_1 = _RAND_11[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      jj <= 2'h0;
    end else begin
      if (io_start) begin
        if (_T_22) begin
          if (_T_35) begin
            jj <= _T_37;
          end else begin
            jj <= 2'h0;
          end
        end
      end
    end
    if (io_start) begin
      if (_T_3) begin
        if (_T_10) begin
          if (_T_5) begin
            best <= m1_0;
          end else begin
            best <= m1_1;
          end
        end
      end
    end
    if (reset) begin
      validPipe0 <= 1'h0;
    end else begin
      if (io_start) begin
        if (_T_22) begin
          validPipe0 <= 1'h1;
        end else begin
          if (_T_14) begin
            validPipe0 <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      prev_jj0 <= 2'h0;
    end else begin
      if (io_start) begin
        if (_T_22) begin
          prev_jj0 <= jj;
        end
      end
    end
    if (io_start) begin
      if (_T_22) begin
        if (_T_24) begin
          m0_0 <= io_out0_bits_0;
        end else begin
          m0_0 <= io_out0_bits_1;
        end
      end
    end
    if (io_start) begin
      if (_T_22) begin
        if (_T_27) begin
          m0_1 <= io_out0_bits_2;
        end else begin
          m0_1 <= io_out0_bits_3;
        end
      end
    end
    if (io_start) begin
      if (_T_22) begin
        if (_T_30) begin
          m0_2 <= io_out0_bits_4;
        end else begin
          m0_2 <= io_out0_bits_5;
        end
      end
    end
    if (io_start) begin
      if (_T_22) begin
        if (_T_33) begin
          m0_3 <= io_out0_bits_6;
        end else begin
          m0_3 <= io_out0_bits_7;
        end
      end
    end
    if (reset) begin
      validPipe1 <= 1'h0;
    end else begin
      if (io_start) begin
        if (_T_14) begin
          validPipe1 <= 1'h1;
        end else begin
          if (_T_3) begin
            validPipe1 <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      prev_jj1 <= 2'h0;
    end else begin
      if (io_start) begin
        if (_T_14) begin
          prev_jj1 <= prev_jj0;
        end
      end
    end
    if (io_start) begin
      if (_T_14) begin
        if (_T_16) begin
          m1_0 <= m0_0;
        end else begin
          m1_0 <= m0_1;
        end
      end
    end
    if (io_start) begin
      if (_T_14) begin
        if (_T_19) begin
          m1_1 <= m0_2;
        end else begin
          m1_1 <= m0_3;
        end
      end
    end
  end
endmodule
module SubtractOut(
  input         clock,
  input         reset,
  input         io_start,
  output        io_out1_ready,
  input         io_out1_valid,
  input  [15:0] io_out1_bits_0,
  input  [15:0] io_out1_bits_1,
  input  [15:0] io_out1_bits_2,
  input  [15:0] io_out1_bits_3,
  input  [15:0] io_out1_bits_4,
  input  [15:0] io_out1_bits_5,
  input  [15:0] io_out1_bits_6,
  input  [15:0] io_out1_bits_7,
  output        io_obest_ready,
  input         io_obest_valid,
  input  [15:0] io_obest_bits,
  input         io_res_ready,
  output        io_res_valid,
  output [15:0] io_res_bits_0,
  output [15:0] io_res_bits_1,
  output [15:0] io_res_bits_2,
  output [15:0] io_res_bits_3,
  output [15:0] io_res_bits_4,
  output [15:0] io_res_bits_5,
  output [15:0] io_res_bits_6,
  output [15:0] io_res_bits_7
);
  reg [1:0] jj; // @[Clamper.scala 166:19]
  reg [31:0] _RAND_0;
  reg [15:0] best; // @[Clamper.scala 168:17]
  reg [31:0] _RAND_1;
  wire  _T; // @[Clamper.scala 178:17]
  wire  _T_1; // @[Clamper.scala 178:25]
  wire  _T_2; // @[Clamper.scala 178:44]
  wire  _T_3; // @[Clamper.scala 178:61]
  wire  _T_5; // @[Clamper.scala 180:16]
  wire [15:0] _GEN_1; // @[Clamper.scala 180:25]
  wire [15:0] _T_7; // @[Clamper.scala 188:44]
  wire [15:0] _T_8; // @[Clamper.scala 188:44]
  wire [15:0] _T_11; // @[Clamper.scala 188:44]
  wire [15:0] _T_12; // @[Clamper.scala 188:44]
  wire [15:0] _T_15; // @[Clamper.scala 188:44]
  wire [15:0] _T_16; // @[Clamper.scala 188:44]
  wire [15:0] _T_19; // @[Clamper.scala 188:44]
  wire [15:0] _T_20; // @[Clamper.scala 188:44]
  wire [15:0] _T_23; // @[Clamper.scala 188:44]
  wire [15:0] _T_24; // @[Clamper.scala 188:44]
  wire [15:0] _T_27; // @[Clamper.scala 188:44]
  wire [15:0] _T_28; // @[Clamper.scala 188:44]
  wire [15:0] _T_31; // @[Clamper.scala 188:44]
  wire [15:0] _T_32; // @[Clamper.scala 188:44]
  wire [15:0] _T_35; // @[Clamper.scala 188:44]
  wire [15:0] _T_36; // @[Clamper.scala 188:44]
  wire  _T_38; // @[Clamper.scala 190:17]
  wire [1:0] _T_40; // @[Clamper.scala 191:18]
  wire  _GEN_3; // @[Clamper.scala 178:78]
  assign _T = jj != 2'h0; // @[Clamper.scala 178:17]
  assign _T_1 = _T | io_obest_valid; // @[Clamper.scala 178:25]
  assign _T_2 = _T_1 & io_out1_valid; // @[Clamper.scala 178:44]
  assign _T_3 = _T_2 & io_res_ready; // @[Clamper.scala 178:61]
  assign _T_5 = jj == 2'h0; // @[Clamper.scala 180:16]
  assign _GEN_1 = _T_5 ? $signed(io_obest_bits) : $signed(best); // @[Clamper.scala 180:25]
  assign _T_7 = $signed(io_out1_bits_0) - $signed(_GEN_1); // @[Clamper.scala 188:44]
  assign _T_8 = $signed(_T_7); // @[Clamper.scala 188:44]
  assign _T_11 = $signed(io_out1_bits_1) - $signed(_GEN_1); // @[Clamper.scala 188:44]
  assign _T_12 = $signed(_T_11); // @[Clamper.scala 188:44]
  assign _T_15 = $signed(io_out1_bits_2) - $signed(_GEN_1); // @[Clamper.scala 188:44]
  assign _T_16 = $signed(_T_15); // @[Clamper.scala 188:44]
  assign _T_19 = $signed(io_out1_bits_3) - $signed(_GEN_1); // @[Clamper.scala 188:44]
  assign _T_20 = $signed(_T_19); // @[Clamper.scala 188:44]
  assign _T_23 = $signed(io_out1_bits_4) - $signed(_GEN_1); // @[Clamper.scala 188:44]
  assign _T_24 = $signed(_T_23); // @[Clamper.scala 188:44]
  assign _T_27 = $signed(io_out1_bits_5) - $signed(_GEN_1); // @[Clamper.scala 188:44]
  assign _T_28 = $signed(_T_27); // @[Clamper.scala 188:44]
  assign _T_31 = $signed(io_out1_bits_6) - $signed(_GEN_1); // @[Clamper.scala 188:44]
  assign _T_32 = $signed(_T_31); // @[Clamper.scala 188:44]
  assign _T_35 = $signed(io_out1_bits_7) - $signed(_GEN_1); // @[Clamper.scala 188:44]
  assign _T_36 = $signed(_T_35); // @[Clamper.scala 188:44]
  assign _T_38 = jj != 2'h2; // @[Clamper.scala 190:17]
  assign _T_40 = jj + 2'h1; // @[Clamper.scala 191:18]
  assign _GEN_3 = _T_3 ? _T_5 : 1'h0; // @[Clamper.scala 178:78]
  assign io_out1_ready = io_start ? _T_3 : 1'h0; // @[Decoupled.scala 69:20 Clamper.scala 185:21]
  assign io_obest_ready = io_start ? _GEN_3 : 1'h0; // @[Decoupled.scala 69:20 Clamper.scala 181:24]
  assign io_res_valid = io_start ? _T_3 : 1'h0; // @[Decoupled.scala 53:20 Clamper.scala 186:20]
  assign io_res_bits_0 = $unsigned(_T_8); // @[Clamper.scala 188:24]
  assign io_res_bits_1 = $unsigned(_T_12); // @[Clamper.scala 188:24]
  assign io_res_bits_2 = $unsigned(_T_16); // @[Clamper.scala 188:24]
  assign io_res_bits_3 = $unsigned(_T_20); // @[Clamper.scala 188:24]
  assign io_res_bits_4 = $unsigned(_T_24); // @[Clamper.scala 188:24]
  assign io_res_bits_5 = $unsigned(_T_28); // @[Clamper.scala 188:24]
  assign io_res_bits_6 = $unsigned(_T_32); // @[Clamper.scala 188:24]
  assign io_res_bits_7 = $unsigned(_T_36); // @[Clamper.scala 188:24]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  jj = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  best = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      jj <= 2'h0;
    end else begin
      if (io_start) begin
        if (_T_3) begin
          if (_T_38) begin
            jj <= _T_40;
          end else begin
            jj <= 2'h0;
          end
        end
      end
    end
    if (io_start) begin
      if (_T_3) begin
        if (_T_5) begin
          best <= io_obest_bits;
        end
      end
    end
  end
endmodule
module DecoupledStage(
  input         clock,
  input         reset,
  output        io_inp_ready,
  input         io_inp_valid,
  input  [15:0] io_inp_bits_0,
  input  [15:0] io_inp_bits_1,
  input  [15:0] io_inp_bits_2,
  input  [15:0] io_inp_bits_3,
  input  [15:0] io_inp_bits_4,
  input  [15:0] io_inp_bits_5,
  input  [15:0] io_inp_bits_6,
  input  [15:0] io_inp_bits_7,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits_0,
  output [15:0] io_out_bits_1,
  output [15:0] io_out_bits_2,
  output [15:0] io_out_bits_3,
  output [15:0] io_out_bits_4,
  output [15:0] io_out_bits_5,
  output [15:0] io_out_bits_6,
  output [15:0] io_out_bits_7
);
  reg  out_valid; // @[DecoupledStage.scala 14:22]
  reg [31:0] _RAND_0;
  reg [15:0] out_bits_0; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_1;
  reg [15:0] out_bits_1; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_2;
  reg [15:0] out_bits_2; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_3;
  reg [15:0] out_bits_3; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_4;
  reg [15:0] out_bits_4; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_5;
  reg [15:0] out_bits_5; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_6;
  reg [15:0] out_bits_6; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_7;
  reg [15:0] out_bits_7; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_8;
  wire  _T; // @[DecoupledStage.scala 20:34]
  wire  _T_2; // @[DecoupledStage.scala 22:31]
  wire  _T_3; // @[DecoupledStage.scala 22:29]
  assign _T = ~ io_out_valid; // @[DecoupledStage.scala 20:34]
  assign _T_2 = ~ io_inp_ready; // @[DecoupledStage.scala 22:31]
  assign _T_3 = io_inp_valid | _T_2; // @[DecoupledStage.scala 22:29]
  assign io_inp_ready = io_out_ready | _T; // @[DecoupledStage.scala 20:16]
  assign io_out_valid = out_valid; // @[DecoupledStage.scala 17:16]
  assign io_out_bits_0 = out_bits_0; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_1 = out_bits_1; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_2 = out_bits_2; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_3 = out_bits_3; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_4 = out_bits_4; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_5 = out_bits_5; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_6 = out_bits_6; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_7 = out_bits_7; // @[DecoupledStage.scala 18:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  out_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  out_bits_0 = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  out_bits_1 = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_bits_2 = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_bits_3 = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  out_bits_4 = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  out_bits_5 = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  out_bits_6 = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  out_bits_7 = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      out_valid <= 1'h0;
    end else begin
      out_valid <= _T_3;
    end
    if (io_inp_ready) begin
      out_bits_0 <= io_inp_bits_0;
    end
    if (io_inp_ready) begin
      out_bits_1 <= io_inp_bits_1;
    end
    if (io_inp_ready) begin
      out_bits_2 <= io_inp_bits_2;
    end
    if (io_inp_ready) begin
      out_bits_3 <= io_inp_bits_3;
    end
    if (io_inp_ready) begin
      out_bits_4 <= io_inp_bits_4;
    end
    if (io_inp_ready) begin
      out_bits_5 <= io_inp_bits_5;
    end
    if (io_inp_ready) begin
      out_bits_6 <= io_inp_bits_6;
    end
    if (io_inp_ready) begin
      out_bits_7 <= io_inp_bits_7;
    end
  end
endmodule
module DecoupledStage_1(
  input         clock,
  input         reset,
  output        io_inp_ready,
  input         io_inp_valid,
  input  [15:0] io_inp_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits
);
  reg  out_valid; // @[DecoupledStage.scala 14:22]
  reg [31:0] _RAND_0;
  reg [15:0] out_bits; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_1;
  wire  _T; // @[DecoupledStage.scala 20:34]
  wire  _T_2; // @[DecoupledStage.scala 22:31]
  wire  _T_3; // @[DecoupledStage.scala 22:29]
  assign _T = ~ io_out_valid; // @[DecoupledStage.scala 20:34]
  assign _T_2 = ~ io_inp_ready; // @[DecoupledStage.scala 22:31]
  assign _T_3 = io_inp_valid | _T_2; // @[DecoupledStage.scala 22:29]
  assign io_inp_ready = io_out_ready | _T; // @[DecoupledStage.scala 20:16]
  assign io_out_valid = out_valid; // @[DecoupledStage.scala 17:16]
  assign io_out_bits = out_bits; // @[DecoupledStage.scala 18:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  out_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  out_bits = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      out_valid <= 1'h0;
    end else begin
      out_valid <= _T_3;
    end
    if (io_inp_ready) begin
      out_bits <= io_inp_bits;
    end
  end
endmodule
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [15:0] io_enq_bits_0,
  input  [15:0] io_enq_bits_1,
  input  [15:0] io_enq_bits_2,
  input  [15:0] io_enq_bits_3,
  input  [15:0] io_enq_bits_4,
  input  [15:0] io_enq_bits_5,
  input  [15:0] io_enq_bits_6,
  input  [15:0] io_enq_bits_7,
  input         io_deq_ready,
  output        io_deq_valid,
  output [15:0] io_deq_bits_0,
  output [15:0] io_deq_bits_1,
  output [15:0] io_deq_bits_2,
  output [15:0] io_deq_bits_3,
  output [15:0] io_deq_bits_4,
  output [15:0] io_deq_bits_5,
  output [15:0] io_deq_bits_6,
  output [15:0] io_deq_bits_7
);
  reg [15:0] _T__0 [0:3]; // @[Decoupled.scala 215:24]
  reg [31:0] _RAND_0;
  wire [15:0] _T__0__T_18_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__0__T_18_addr; // @[Decoupled.scala 215:24]
  wire [15:0] _T__0__T_10_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__0__T_10_addr; // @[Decoupled.scala 215:24]
  wire  _T__0__T_10_mask; // @[Decoupled.scala 215:24]
  wire  _T__0__T_10_en; // @[Decoupled.scala 215:24]
  reg [15:0] _T__1 [0:3]; // @[Decoupled.scala 215:24]
  reg [31:0] _RAND_1;
  wire [15:0] _T__1__T_18_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__1__T_18_addr; // @[Decoupled.scala 215:24]
  wire [15:0] _T__1__T_10_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__1__T_10_addr; // @[Decoupled.scala 215:24]
  wire  _T__1__T_10_mask; // @[Decoupled.scala 215:24]
  wire  _T__1__T_10_en; // @[Decoupled.scala 215:24]
  reg [15:0] _T__2 [0:3]; // @[Decoupled.scala 215:24]
  reg [31:0] _RAND_2;
  wire [15:0] _T__2__T_18_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__2__T_18_addr; // @[Decoupled.scala 215:24]
  wire [15:0] _T__2__T_10_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__2__T_10_addr; // @[Decoupled.scala 215:24]
  wire  _T__2__T_10_mask; // @[Decoupled.scala 215:24]
  wire  _T__2__T_10_en; // @[Decoupled.scala 215:24]
  reg [15:0] _T__3 [0:3]; // @[Decoupled.scala 215:24]
  reg [31:0] _RAND_3;
  wire [15:0] _T__3__T_18_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__3__T_18_addr; // @[Decoupled.scala 215:24]
  wire [15:0] _T__3__T_10_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__3__T_10_addr; // @[Decoupled.scala 215:24]
  wire  _T__3__T_10_mask; // @[Decoupled.scala 215:24]
  wire  _T__3__T_10_en; // @[Decoupled.scala 215:24]
  reg [15:0] _T__4 [0:3]; // @[Decoupled.scala 215:24]
  reg [31:0] _RAND_4;
  wire [15:0] _T__4__T_18_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__4__T_18_addr; // @[Decoupled.scala 215:24]
  wire [15:0] _T__4__T_10_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__4__T_10_addr; // @[Decoupled.scala 215:24]
  wire  _T__4__T_10_mask; // @[Decoupled.scala 215:24]
  wire  _T__4__T_10_en; // @[Decoupled.scala 215:24]
  reg [15:0] _T__5 [0:3]; // @[Decoupled.scala 215:24]
  reg [31:0] _RAND_5;
  wire [15:0] _T__5__T_18_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__5__T_18_addr; // @[Decoupled.scala 215:24]
  wire [15:0] _T__5__T_10_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__5__T_10_addr; // @[Decoupled.scala 215:24]
  wire  _T__5__T_10_mask; // @[Decoupled.scala 215:24]
  wire  _T__5__T_10_en; // @[Decoupled.scala 215:24]
  reg [15:0] _T__6 [0:3]; // @[Decoupled.scala 215:24]
  reg [31:0] _RAND_6;
  wire [15:0] _T__6__T_18_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__6__T_18_addr; // @[Decoupled.scala 215:24]
  wire [15:0] _T__6__T_10_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__6__T_10_addr; // @[Decoupled.scala 215:24]
  wire  _T__6__T_10_mask; // @[Decoupled.scala 215:24]
  wire  _T__6__T_10_en; // @[Decoupled.scala 215:24]
  reg [15:0] _T__7 [0:3]; // @[Decoupled.scala 215:24]
  reg [31:0] _RAND_7;
  wire [15:0] _T__7__T_18_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__7__T_18_addr; // @[Decoupled.scala 215:24]
  wire [15:0] _T__7__T_10_data; // @[Decoupled.scala 215:24]
  wire [1:0] _T__7__T_10_addr; // @[Decoupled.scala 215:24]
  wire  _T__7__T_10_mask; // @[Decoupled.scala 215:24]
  wire  _T__7__T_10_en; // @[Decoupled.scala 215:24]
  reg [1:0] value; // @[Counter.scala 26:33]
  reg [31:0] _RAND_8;
  reg [1:0] value_1; // @[Counter.scala 26:33]
  reg [31:0] _RAND_9;
  reg  _T_1; // @[Decoupled.scala 218:35]
  reg [31:0] _RAND_10;
  wire  _T_2; // @[Decoupled.scala 220:41]
  wire  _T_3; // @[Decoupled.scala 221:36]
  wire  _T_4; // @[Decoupled.scala 221:33]
  wire  _T_5; // @[Decoupled.scala 222:32]
  wire  _T_6; // @[Decoupled.scala 37:37]
  wire  _T_8; // @[Decoupled.scala 37:37]
  wire [1:0] _T_12; // @[Counter.scala 35:22]
  wire [1:0] _T_14; // @[Counter.scala 35:22]
  wire  _T_15; // @[Decoupled.scala 233:16]
  wire  _T_17; // @[Decoupled.scala 238:19]
  assign _T__0__T_18_addr = value_1;
  assign _T__0__T_18_data = _T__0[_T__0__T_18_addr]; // @[Decoupled.scala 215:24]
  assign _T__0__T_10_data = io_enq_bits_0;
  assign _T__0__T_10_addr = value;
  assign _T__0__T_10_mask = 1'h1;
  assign _T__0__T_10_en = io_enq_ready & io_enq_valid;
  assign _T__1__T_18_addr = value_1;
  assign _T__1__T_18_data = _T__1[_T__1__T_18_addr]; // @[Decoupled.scala 215:24]
  assign _T__1__T_10_data = io_enq_bits_1;
  assign _T__1__T_10_addr = value;
  assign _T__1__T_10_mask = 1'h1;
  assign _T__1__T_10_en = io_enq_ready & io_enq_valid;
  assign _T__2__T_18_addr = value_1;
  assign _T__2__T_18_data = _T__2[_T__2__T_18_addr]; // @[Decoupled.scala 215:24]
  assign _T__2__T_10_data = io_enq_bits_2;
  assign _T__2__T_10_addr = value;
  assign _T__2__T_10_mask = 1'h1;
  assign _T__2__T_10_en = io_enq_ready & io_enq_valid;
  assign _T__3__T_18_addr = value_1;
  assign _T__3__T_18_data = _T__3[_T__3__T_18_addr]; // @[Decoupled.scala 215:24]
  assign _T__3__T_10_data = io_enq_bits_3;
  assign _T__3__T_10_addr = value;
  assign _T__3__T_10_mask = 1'h1;
  assign _T__3__T_10_en = io_enq_ready & io_enq_valid;
  assign _T__4__T_18_addr = value_1;
  assign _T__4__T_18_data = _T__4[_T__4__T_18_addr]; // @[Decoupled.scala 215:24]
  assign _T__4__T_10_data = io_enq_bits_4;
  assign _T__4__T_10_addr = value;
  assign _T__4__T_10_mask = 1'h1;
  assign _T__4__T_10_en = io_enq_ready & io_enq_valid;
  assign _T__5__T_18_addr = value_1;
  assign _T__5__T_18_data = _T__5[_T__5__T_18_addr]; // @[Decoupled.scala 215:24]
  assign _T__5__T_10_data = io_enq_bits_5;
  assign _T__5__T_10_addr = value;
  assign _T__5__T_10_mask = 1'h1;
  assign _T__5__T_10_en = io_enq_ready & io_enq_valid;
  assign _T__6__T_18_addr = value_1;
  assign _T__6__T_18_data = _T__6[_T__6__T_18_addr]; // @[Decoupled.scala 215:24]
  assign _T__6__T_10_data = io_enq_bits_6;
  assign _T__6__T_10_addr = value;
  assign _T__6__T_10_mask = 1'h1;
  assign _T__6__T_10_en = io_enq_ready & io_enq_valid;
  assign _T__7__T_18_addr = value_1;
  assign _T__7__T_18_data = _T__7[_T__7__T_18_addr]; // @[Decoupled.scala 215:24]
  assign _T__7__T_10_data = io_enq_bits_7;
  assign _T__7__T_10_addr = value;
  assign _T__7__T_10_mask = 1'h1;
  assign _T__7__T_10_en = io_enq_ready & io_enq_valid;
  assign _T_2 = value == value_1; // @[Decoupled.scala 220:41]
  assign _T_3 = _T_1 == 1'h0; // @[Decoupled.scala 221:36]
  assign _T_4 = _T_2 & _T_3; // @[Decoupled.scala 221:33]
  assign _T_5 = _T_2 & _T_1; // @[Decoupled.scala 222:32]
  assign _T_6 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37]
  assign _T_8 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37]
  assign _T_12 = value + 2'h1; // @[Counter.scala 35:22]
  assign _T_14 = value_1 + 2'h1; // @[Counter.scala 35:22]
  assign _T_15 = _T_6 != _T_8; // @[Decoupled.scala 233:16]
  assign _T_17 = _T_5 == 1'h0; // @[Decoupled.scala 238:19]
  assign io_enq_ready = io_deq_ready ? 1'h1 : _T_17; // @[Decoupled.scala 238:16 Decoupled.scala 251:40]
  assign io_deq_valid = _T_4 == 1'h0; // @[Decoupled.scala 237:16]
  assign io_deq_bits_0 = _T__0__T_18_data; // @[Decoupled.scala 239:15]
  assign io_deq_bits_1 = _T__1__T_18_data; // @[Decoupled.scala 239:15]
  assign io_deq_bits_2 = _T__2__T_18_data; // @[Decoupled.scala 239:15]
  assign io_deq_bits_3 = _T__3__T_18_data; // @[Decoupled.scala 239:15]
  assign io_deq_bits_4 = _T__4__T_18_data; // @[Decoupled.scala 239:15]
  assign io_deq_bits_5 = _T__5__T_18_data; // @[Decoupled.scala 239:15]
  assign io_deq_bits_6 = _T__6__T_18_data; // @[Decoupled.scala 239:15]
  assign io_deq_bits_7 = _T__7__T_18_data; // @[Decoupled.scala 239:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T__0[initvar] = _RAND_0[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T__1[initvar] = _RAND_1[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T__2[initvar] = _RAND_2[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T__3[initvar] = _RAND_3[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T__4[initvar] = _RAND_4[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_5 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T__5[initvar] = _RAND_5[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_6 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T__6[initvar] = _RAND_6[15:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_7 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T__7[initvar] = _RAND_7[15:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  value = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  value_1 = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_1 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T__0__T_10_en & _T__0__T_10_mask) begin
      _T__0[_T__0__T_10_addr] <= _T__0__T_10_data; // @[Decoupled.scala 215:24]
    end
    if(_T__1__T_10_en & _T__1__T_10_mask) begin
      _T__1[_T__1__T_10_addr] <= _T__1__T_10_data; // @[Decoupled.scala 215:24]
    end
    if(_T__2__T_10_en & _T__2__T_10_mask) begin
      _T__2[_T__2__T_10_addr] <= _T__2__T_10_data; // @[Decoupled.scala 215:24]
    end
    if(_T__3__T_10_en & _T__3__T_10_mask) begin
      _T__3[_T__3__T_10_addr] <= _T__3__T_10_data; // @[Decoupled.scala 215:24]
    end
    if(_T__4__T_10_en & _T__4__T_10_mask) begin
      _T__4[_T__4__T_10_addr] <= _T__4__T_10_data; // @[Decoupled.scala 215:24]
    end
    if(_T__5__T_10_en & _T__5__T_10_mask) begin
      _T__5[_T__5__T_10_addr] <= _T__5__T_10_data; // @[Decoupled.scala 215:24]
    end
    if(_T__6__T_10_en & _T__6__T_10_mask) begin
      _T__6[_T__6__T_10_addr] <= _T__6__T_10_data; // @[Decoupled.scala 215:24]
    end
    if(_T__7__T_10_en & _T__7__T_10_mask) begin
      _T__7[_T__7__T_10_addr] <= _T__7__T_10_data; // @[Decoupled.scala 215:24]
    end
    if (reset) begin
      value <= 2'h0;
    end else begin
      if (_T_6) begin
        value <= _T_12;
      end
    end
    if (reset) begin
      value_1 <= 2'h0;
    end else begin
      if (_T_8) begin
        value_1 <= _T_14;
      end
    end
    if (reset) begin
      _T_1 <= 1'h0;
    end else begin
      if (_T_15) begin
        _T_1 <= _T_6;
      end
    end
  end
endmodule
module DecoupledStage_2(
  input         clock,
  input         reset,
  output        io_inp_ready,
  input         io_inp_valid,
  input  [15:0] io_inp_bits_0,
  input  [15:0] io_inp_bits_1,
  input  [15:0] io_inp_bits_2,
  input  [15:0] io_inp_bits_3,
  input  [15:0] io_inp_bits_4,
  input  [15:0] io_inp_bits_5,
  input  [15:0] io_inp_bits_6,
  input  [15:0] io_inp_bits_7,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits_0,
  output [15:0] io_out_bits_1,
  output [15:0] io_out_bits_2,
  output [15:0] io_out_bits_3,
  output [15:0] io_out_bits_4,
  output [15:0] io_out_bits_5,
  output [15:0] io_out_bits_6,
  output [15:0] io_out_bits_7
);
  reg  out_valid; // @[DecoupledStage.scala 14:22]
  reg [31:0] _RAND_0;
  reg [15:0] out_bits_0; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_1;
  reg [15:0] out_bits_1; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_2;
  reg [15:0] out_bits_2; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_3;
  reg [15:0] out_bits_3; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_4;
  reg [15:0] out_bits_4; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_5;
  reg [15:0] out_bits_5; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_6;
  reg [15:0] out_bits_6; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_7;
  reg [15:0] out_bits_7; // @[DecoupledStage.scala 15:21]
  reg [31:0] _RAND_8;
  wire  _T; // @[DecoupledStage.scala 20:34]
  wire  _T_2; // @[DecoupledStage.scala 22:31]
  wire  _T_3; // @[DecoupledStage.scala 22:29]
  assign _T = ~ io_out_valid; // @[DecoupledStage.scala 20:34]
  assign _T_2 = ~ io_inp_ready; // @[DecoupledStage.scala 22:31]
  assign _T_3 = io_inp_valid | _T_2; // @[DecoupledStage.scala 22:29]
  assign io_inp_ready = io_out_ready | _T; // @[DecoupledStage.scala 20:16]
  assign io_out_valid = out_valid; // @[DecoupledStage.scala 17:16]
  assign io_out_bits_0 = out_bits_0; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_1 = out_bits_1; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_2 = out_bits_2; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_3 = out_bits_3; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_4 = out_bits_4; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_5 = out_bits_5; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_6 = out_bits_6; // @[DecoupledStage.scala 18:16]
  assign io_out_bits_7 = out_bits_7; // @[DecoupledStage.scala 18:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  out_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  out_bits_0 = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  out_bits_1 = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out_bits_2 = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  out_bits_3 = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  out_bits_4 = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  out_bits_5 = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  out_bits_6 = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  out_bits_7 = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      out_valid <= 1'h0;
    end else begin
      out_valid <= _T_3;
    end
    if (io_inp_ready) begin
      out_bits_0 <= io_inp_bits_0;
    end
    if (io_inp_ready) begin
      out_bits_1 <= io_inp_bits_1;
    end
    if (io_inp_ready) begin
      out_bits_2 <= io_inp_bits_2;
    end
    if (io_inp_ready) begin
      out_bits_3 <= io_inp_bits_3;
    end
    if (io_inp_ready) begin
      out_bits_4 <= io_inp_bits_4;
    end
    if (io_inp_ready) begin
      out_bits_5 <= io_inp_bits_5;
    end
    if (io_inp_ready) begin
      out_bits_6 <= io_inp_bits_6;
    end
    if (io_inp_ready) begin
      out_bits_7 <= io_inp_bits_7;
    end
  end
endmodule
module Clamper(
  input         clock,
  input         reset,
  input         io_start,
  output        io_out_ready,
  input         io_out_valid,
  input  [15:0] io_out_bits_0,
  input  [15:0] io_out_bits_1,
  input  [15:0] io_out_bits_2,
  input  [15:0] io_out_bits_3,
  input  [15:0] io_out_bits_4,
  input  [15:0] io_out_bits_5,
  input  [15:0] io_out_bits_6,
  input  [15:0] io_out_bits_7,
  input         io_res_ready,
  output        io_res_valid,
  output [15:0] io_res_bits_0,
  output [15:0] io_res_bits_1,
  output [15:0] io_res_bits_2,
  output [15:0] io_res_bits_3,
  output [15:0] io_res_bits_4,
  output [15:0] io_res_bits_5,
  output [15:0] io_res_bits_6,
  output [15:0] io_res_bits_7
);
  wire  splitOut_io_start; // @[Clamper.scala 209:24]
  wire  splitOut_io_out_ready; // @[Clamper.scala 209:24]
  wire  splitOut_io_out_valid; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out_bits_0; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out_bits_1; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out_bits_2; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out_bits_3; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out_bits_4; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out_bits_5; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out_bits_6; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out_bits_7; // @[Clamper.scala 209:24]
  wire  splitOut_io_out0_ready; // @[Clamper.scala 209:24]
  wire  splitOut_io_out0_valid; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out0_bits_0; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out0_bits_1; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out0_bits_2; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out0_bits_3; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out0_bits_4; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out0_bits_5; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out0_bits_6; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out0_bits_7; // @[Clamper.scala 209:24]
  wire  splitOut_io_out1_ready; // @[Clamper.scala 209:24]
  wire  splitOut_io_out1_valid; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out1_bits_0; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out1_bits_1; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out1_bits_2; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out1_bits_3; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out1_bits_4; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out1_bits_5; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out1_bits_6; // @[Clamper.scala 209:24]
  wire [15:0] splitOut_io_out1_bits_7; // @[Clamper.scala 209:24]
  wire  computeBest_clock; // @[Clamper.scala 210:27]
  wire  computeBest_reset; // @[Clamper.scala 210:27]
  wire  computeBest_io_start; // @[Clamper.scala 210:27]
  wire  computeBest_io_out0_ready; // @[Clamper.scala 210:27]
  wire  computeBest_io_out0_valid; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_out0_bits_0; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_out0_bits_1; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_out0_bits_2; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_out0_bits_3; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_out0_bits_4; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_out0_bits_5; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_out0_bits_6; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_out0_bits_7; // @[Clamper.scala 210:27]
  wire  computeBest_io_obest_ready; // @[Clamper.scala 210:27]
  wire  computeBest_io_obest_valid; // @[Clamper.scala 210:27]
  wire [15:0] computeBest_io_obest_bits; // @[Clamper.scala 210:27]
  wire  subtractOut_clock; // @[Clamper.scala 211:27]
  wire  subtractOut_reset; // @[Clamper.scala 211:27]
  wire  subtractOut_io_start; // @[Clamper.scala 211:27]
  wire  subtractOut_io_out1_ready; // @[Clamper.scala 211:27]
  wire  subtractOut_io_out1_valid; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_out1_bits_0; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_out1_bits_1; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_out1_bits_2; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_out1_bits_3; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_out1_bits_4; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_out1_bits_5; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_out1_bits_6; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_out1_bits_7; // @[Clamper.scala 211:27]
  wire  subtractOut_io_obest_ready; // @[Clamper.scala 211:27]
  wire  subtractOut_io_obest_valid; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_obest_bits; // @[Clamper.scala 211:27]
  wire  subtractOut_io_res_ready; // @[Clamper.scala 211:27]
  wire  subtractOut_io_res_valid; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_res_bits_0; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_res_bits_1; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_res_bits_2; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_res_bits_3; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_res_bits_4; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_res_bits_5; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_res_bits_6; // @[Clamper.scala 211:27]
  wire [15:0] subtractOut_io_res_bits_7; // @[Clamper.scala 211:27]
  wire  DecoupledStage_clock; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_reset; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_io_inp_ready; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_io_inp_valid; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_inp_bits_0; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_inp_bits_1; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_inp_bits_2; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_inp_bits_3; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_inp_bits_4; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_inp_bits_5; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_inp_bits_6; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_inp_bits_7; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_io_out_ready; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_io_out_valid; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_out_bits_0; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_out_bits_1; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_out_bits_2; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_out_bits_3; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_out_bits_4; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_out_bits_5; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_out_bits_6; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_io_out_bits_7; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_1_clock; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_1_reset; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_1_io_inp_ready; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_1_io_inp_valid; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_1_io_inp_bits; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_1_io_out_ready; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_1_io_out_valid; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_1_io_out_bits; // @[DecoupledStage.scala 30:19]
  wire  Queue_clock; // @[Decoupled.scala 294:21]
  wire  Queue_reset; // @[Decoupled.scala 294:21]
  wire  Queue_io_enq_ready; // @[Decoupled.scala 294:21]
  wire  Queue_io_enq_valid; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_enq_bits_0; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_enq_bits_1; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_enq_bits_2; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_enq_bits_3; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_enq_bits_4; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_enq_bits_5; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_enq_bits_6; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_enq_bits_7; // @[Decoupled.scala 294:21]
  wire  Queue_io_deq_ready; // @[Decoupled.scala 294:21]
  wire  Queue_io_deq_valid; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_deq_bits_0; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_deq_bits_1; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_deq_bits_2; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_deq_bits_3; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_deq_bits_4; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_deq_bits_5; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_deq_bits_6; // @[Decoupled.scala 294:21]
  wire [15:0] Queue_io_deq_bits_7; // @[Decoupled.scala 294:21]
  wire  DecoupledStage_2_clock; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_2_reset; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_2_io_inp_ready; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_2_io_inp_valid; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_inp_bits_0; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_inp_bits_1; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_inp_bits_2; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_inp_bits_3; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_inp_bits_4; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_inp_bits_5; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_inp_bits_6; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_inp_bits_7; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_2_io_out_ready; // @[DecoupledStage.scala 30:19]
  wire  DecoupledStage_2_io_out_valid; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_out_bits_0; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_out_bits_1; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_out_bits_2; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_out_bits_3; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_out_bits_4; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_out_bits_5; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_out_bits_6; // @[DecoupledStage.scala 30:19]
  wire [15:0] DecoupledStage_2_io_out_bits_7; // @[DecoupledStage.scala 30:19]
  SplitOut splitOut ( // @[Clamper.scala 209:24]
    .io_start(splitOut_io_start),
    .io_out_ready(splitOut_io_out_ready),
    .io_out_valid(splitOut_io_out_valid),
    .io_out_bits_0(splitOut_io_out_bits_0),
    .io_out_bits_1(splitOut_io_out_bits_1),
    .io_out_bits_2(splitOut_io_out_bits_2),
    .io_out_bits_3(splitOut_io_out_bits_3),
    .io_out_bits_4(splitOut_io_out_bits_4),
    .io_out_bits_5(splitOut_io_out_bits_5),
    .io_out_bits_6(splitOut_io_out_bits_6),
    .io_out_bits_7(splitOut_io_out_bits_7),
    .io_out0_ready(splitOut_io_out0_ready),
    .io_out0_valid(splitOut_io_out0_valid),
    .io_out0_bits_0(splitOut_io_out0_bits_0),
    .io_out0_bits_1(splitOut_io_out0_bits_1),
    .io_out0_bits_2(splitOut_io_out0_bits_2),
    .io_out0_bits_3(splitOut_io_out0_bits_3),
    .io_out0_bits_4(splitOut_io_out0_bits_4),
    .io_out0_bits_5(splitOut_io_out0_bits_5),
    .io_out0_bits_6(splitOut_io_out0_bits_6),
    .io_out0_bits_7(splitOut_io_out0_bits_7),
    .io_out1_ready(splitOut_io_out1_ready),
    .io_out1_valid(splitOut_io_out1_valid),
    .io_out1_bits_0(splitOut_io_out1_bits_0),
    .io_out1_bits_1(splitOut_io_out1_bits_1),
    .io_out1_bits_2(splitOut_io_out1_bits_2),
    .io_out1_bits_3(splitOut_io_out1_bits_3),
    .io_out1_bits_4(splitOut_io_out1_bits_4),
    .io_out1_bits_5(splitOut_io_out1_bits_5),
    .io_out1_bits_6(splitOut_io_out1_bits_6),
    .io_out1_bits_7(splitOut_io_out1_bits_7)
  );
  ComputeBest computeBest ( // @[Clamper.scala 210:27]
    .clock(computeBest_clock),
    .reset(computeBest_reset),
    .io_start(computeBest_io_start),
    .io_out0_ready(computeBest_io_out0_ready),
    .io_out0_valid(computeBest_io_out0_valid),
    .io_out0_bits_0(computeBest_io_out0_bits_0),
    .io_out0_bits_1(computeBest_io_out0_bits_1),
    .io_out0_bits_2(computeBest_io_out0_bits_2),
    .io_out0_bits_3(computeBest_io_out0_bits_3),
    .io_out0_bits_4(computeBest_io_out0_bits_4),
    .io_out0_bits_5(computeBest_io_out0_bits_5),
    .io_out0_bits_6(computeBest_io_out0_bits_6),
    .io_out0_bits_7(computeBest_io_out0_bits_7),
    .io_obest_ready(computeBest_io_obest_ready),
    .io_obest_valid(computeBest_io_obest_valid),
    .io_obest_bits(computeBest_io_obest_bits)
  );
  SubtractOut subtractOut ( // @[Clamper.scala 211:27]
    .clock(subtractOut_clock),
    .reset(subtractOut_reset),
    .io_start(subtractOut_io_start),
    .io_out1_ready(subtractOut_io_out1_ready),
    .io_out1_valid(subtractOut_io_out1_valid),
    .io_out1_bits_0(subtractOut_io_out1_bits_0),
    .io_out1_bits_1(subtractOut_io_out1_bits_1),
    .io_out1_bits_2(subtractOut_io_out1_bits_2),
    .io_out1_bits_3(subtractOut_io_out1_bits_3),
    .io_out1_bits_4(subtractOut_io_out1_bits_4),
    .io_out1_bits_5(subtractOut_io_out1_bits_5),
    .io_out1_bits_6(subtractOut_io_out1_bits_6),
    .io_out1_bits_7(subtractOut_io_out1_bits_7),
    .io_obest_ready(subtractOut_io_obest_ready),
    .io_obest_valid(subtractOut_io_obest_valid),
    .io_obest_bits(subtractOut_io_obest_bits),
    .io_res_ready(subtractOut_io_res_ready),
    .io_res_valid(subtractOut_io_res_valid),
    .io_res_bits_0(subtractOut_io_res_bits_0),
    .io_res_bits_1(subtractOut_io_res_bits_1),
    .io_res_bits_2(subtractOut_io_res_bits_2),
    .io_res_bits_3(subtractOut_io_res_bits_3),
    .io_res_bits_4(subtractOut_io_res_bits_4),
    .io_res_bits_5(subtractOut_io_res_bits_5),
    .io_res_bits_6(subtractOut_io_res_bits_6),
    .io_res_bits_7(subtractOut_io_res_bits_7)
  );
  DecoupledStage DecoupledStage ( // @[DecoupledStage.scala 30:19]
    .clock(DecoupledStage_clock),
    .reset(DecoupledStage_reset),
    .io_inp_ready(DecoupledStage_io_inp_ready),
    .io_inp_valid(DecoupledStage_io_inp_valid),
    .io_inp_bits_0(DecoupledStage_io_inp_bits_0),
    .io_inp_bits_1(DecoupledStage_io_inp_bits_1),
    .io_inp_bits_2(DecoupledStage_io_inp_bits_2),
    .io_inp_bits_3(DecoupledStage_io_inp_bits_3),
    .io_inp_bits_4(DecoupledStage_io_inp_bits_4),
    .io_inp_bits_5(DecoupledStage_io_inp_bits_5),
    .io_inp_bits_6(DecoupledStage_io_inp_bits_6),
    .io_inp_bits_7(DecoupledStage_io_inp_bits_7),
    .io_out_ready(DecoupledStage_io_out_ready),
    .io_out_valid(DecoupledStage_io_out_valid),
    .io_out_bits_0(DecoupledStage_io_out_bits_0),
    .io_out_bits_1(DecoupledStage_io_out_bits_1),
    .io_out_bits_2(DecoupledStage_io_out_bits_2),
    .io_out_bits_3(DecoupledStage_io_out_bits_3),
    .io_out_bits_4(DecoupledStage_io_out_bits_4),
    .io_out_bits_5(DecoupledStage_io_out_bits_5),
    .io_out_bits_6(DecoupledStage_io_out_bits_6),
    .io_out_bits_7(DecoupledStage_io_out_bits_7)
  );
  DecoupledStage_1 DecoupledStage_1 ( // @[DecoupledStage.scala 30:19]
    .clock(DecoupledStage_1_clock),
    .reset(DecoupledStage_1_reset),
    .io_inp_ready(DecoupledStage_1_io_inp_ready),
    .io_inp_valid(DecoupledStage_1_io_inp_valid),
    .io_inp_bits(DecoupledStage_1_io_inp_bits),
    .io_out_ready(DecoupledStage_1_io_out_ready),
    .io_out_valid(DecoupledStage_1_io_out_valid),
    .io_out_bits(DecoupledStage_1_io_out_bits)
  );
  Queue Queue ( // @[Decoupled.scala 294:21]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_0(Queue_io_enq_bits_0),
    .io_enq_bits_1(Queue_io_enq_bits_1),
    .io_enq_bits_2(Queue_io_enq_bits_2),
    .io_enq_bits_3(Queue_io_enq_bits_3),
    .io_enq_bits_4(Queue_io_enq_bits_4),
    .io_enq_bits_5(Queue_io_enq_bits_5),
    .io_enq_bits_6(Queue_io_enq_bits_6),
    .io_enq_bits_7(Queue_io_enq_bits_7),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_0(Queue_io_deq_bits_0),
    .io_deq_bits_1(Queue_io_deq_bits_1),
    .io_deq_bits_2(Queue_io_deq_bits_2),
    .io_deq_bits_3(Queue_io_deq_bits_3),
    .io_deq_bits_4(Queue_io_deq_bits_4),
    .io_deq_bits_5(Queue_io_deq_bits_5),
    .io_deq_bits_6(Queue_io_deq_bits_6),
    .io_deq_bits_7(Queue_io_deq_bits_7)
  );
  DecoupledStage_2 DecoupledStage_2 ( // @[DecoupledStage.scala 30:19]
    .clock(DecoupledStage_2_clock),
    .reset(DecoupledStage_2_reset),
    .io_inp_ready(DecoupledStage_2_io_inp_ready),
    .io_inp_valid(DecoupledStage_2_io_inp_valid),
    .io_inp_bits_0(DecoupledStage_2_io_inp_bits_0),
    .io_inp_bits_1(DecoupledStage_2_io_inp_bits_1),
    .io_inp_bits_2(DecoupledStage_2_io_inp_bits_2),
    .io_inp_bits_3(DecoupledStage_2_io_inp_bits_3),
    .io_inp_bits_4(DecoupledStage_2_io_inp_bits_4),
    .io_inp_bits_5(DecoupledStage_2_io_inp_bits_5),
    .io_inp_bits_6(DecoupledStage_2_io_inp_bits_6),
    .io_inp_bits_7(DecoupledStage_2_io_inp_bits_7),
    .io_out_ready(DecoupledStage_2_io_out_ready),
    .io_out_valid(DecoupledStage_2_io_out_valid),
    .io_out_bits_0(DecoupledStage_2_io_out_bits_0),
    .io_out_bits_1(DecoupledStage_2_io_out_bits_1),
    .io_out_bits_2(DecoupledStage_2_io_out_bits_2),
    .io_out_bits_3(DecoupledStage_2_io_out_bits_3),
    .io_out_bits_4(DecoupledStage_2_io_out_bits_4),
    .io_out_bits_5(DecoupledStage_2_io_out_bits_5),
    .io_out_bits_6(DecoupledStage_2_io_out_bits_6),
    .io_out_bits_7(DecoupledStage_2_io_out_bits_7)
  );
  assign io_out_ready = splitOut_io_out_ready; // @[Clamper.scala 213:19]
  assign io_res_valid = DecoupledStage_2_io_out_valid; // @[Clamper.scala 223:10]
  assign io_res_bits_0 = DecoupledStage_2_io_out_bits_0; // @[Clamper.scala 223:10]
  assign io_res_bits_1 = DecoupledStage_2_io_out_bits_1; // @[Clamper.scala 223:10]
  assign io_res_bits_2 = DecoupledStage_2_io_out_bits_2; // @[Clamper.scala 223:10]
  assign io_res_bits_3 = DecoupledStage_2_io_out_bits_3; // @[Clamper.scala 223:10]
  assign io_res_bits_4 = DecoupledStage_2_io_out_bits_4; // @[Clamper.scala 223:10]
  assign io_res_bits_5 = DecoupledStage_2_io_out_bits_5; // @[Clamper.scala 223:10]
  assign io_res_bits_6 = DecoupledStage_2_io_out_bits_6; // @[Clamper.scala 223:10]
  assign io_res_bits_7 = DecoupledStage_2_io_out_bits_7; // @[Clamper.scala 223:10]
  assign splitOut_io_start = io_start; // @[Clamper.scala 214:21]
  assign splitOut_io_out_valid = io_out_valid; // @[Clamper.scala 213:19]
  assign splitOut_io_out_bits_0 = io_out_bits_0; // @[Clamper.scala 213:19]
  assign splitOut_io_out_bits_1 = io_out_bits_1; // @[Clamper.scala 213:19]
  assign splitOut_io_out_bits_2 = io_out_bits_2; // @[Clamper.scala 213:19]
  assign splitOut_io_out_bits_3 = io_out_bits_3; // @[Clamper.scala 213:19]
  assign splitOut_io_out_bits_4 = io_out_bits_4; // @[Clamper.scala 213:19]
  assign splitOut_io_out_bits_5 = io_out_bits_5; // @[Clamper.scala 213:19]
  assign splitOut_io_out_bits_6 = io_out_bits_6; // @[Clamper.scala 213:19]
  assign splitOut_io_out_bits_7 = io_out_bits_7; // @[Clamper.scala 213:19]
  assign splitOut_io_out0_ready = DecoupledStage_io_inp_ready; // @[DecoupledStage.scala 33:15]
  assign splitOut_io_out1_ready = Queue_io_enq_ready; // @[Decoupled.scala 297:17]
  assign computeBest_clock = clock;
  assign computeBest_reset = reset;
  assign computeBest_io_start = io_start; // @[Clamper.scala 217:24]
  assign computeBest_io_out0_valid = DecoupledStage_io_out_valid; // @[Clamper.scala 216:23]
  assign computeBest_io_out0_bits_0 = DecoupledStage_io_out_bits_0; // @[Clamper.scala 216:23]
  assign computeBest_io_out0_bits_1 = DecoupledStage_io_out_bits_1; // @[Clamper.scala 216:23]
  assign computeBest_io_out0_bits_2 = DecoupledStage_io_out_bits_2; // @[Clamper.scala 216:23]
  assign computeBest_io_out0_bits_3 = DecoupledStage_io_out_bits_3; // @[Clamper.scala 216:23]
  assign computeBest_io_out0_bits_4 = DecoupledStage_io_out_bits_4; // @[Clamper.scala 216:23]
  assign computeBest_io_out0_bits_5 = DecoupledStage_io_out_bits_5; // @[Clamper.scala 216:23]
  assign computeBest_io_out0_bits_6 = DecoupledStage_io_out_bits_6; // @[Clamper.scala 216:23]
  assign computeBest_io_out0_bits_7 = DecoupledStage_io_out_bits_7; // @[Clamper.scala 216:23]
  assign computeBest_io_obest_ready = DecoupledStage_1_io_inp_ready; // @[DecoupledStage.scala 33:15]
  assign subtractOut_clock = clock;
  assign subtractOut_reset = reset;
  assign subtractOut_io_start = io_start; // @[Clamper.scala 221:24]
  assign subtractOut_io_out1_valid = Queue_io_deq_valid; // @[Clamper.scala 220:23]
  assign subtractOut_io_out1_bits_0 = Queue_io_deq_bits_0; // @[Clamper.scala 220:23]
  assign subtractOut_io_out1_bits_1 = Queue_io_deq_bits_1; // @[Clamper.scala 220:23]
  assign subtractOut_io_out1_bits_2 = Queue_io_deq_bits_2; // @[Clamper.scala 220:23]
  assign subtractOut_io_out1_bits_3 = Queue_io_deq_bits_3; // @[Clamper.scala 220:23]
  assign subtractOut_io_out1_bits_4 = Queue_io_deq_bits_4; // @[Clamper.scala 220:23]
  assign subtractOut_io_out1_bits_5 = Queue_io_deq_bits_5; // @[Clamper.scala 220:23]
  assign subtractOut_io_out1_bits_6 = Queue_io_deq_bits_6; // @[Clamper.scala 220:23]
  assign subtractOut_io_out1_bits_7 = Queue_io_deq_bits_7; // @[Clamper.scala 220:23]
  assign subtractOut_io_obest_valid = DecoupledStage_1_io_out_valid; // @[Clamper.scala 219:24]
  assign subtractOut_io_obest_bits = DecoupledStage_1_io_out_bits; // @[Clamper.scala 219:24]
  assign subtractOut_io_res_ready = DecoupledStage_2_io_inp_ready; // @[DecoupledStage.scala 33:15]
  assign DecoupledStage_clock = clock;
  assign DecoupledStage_reset = reset;
  assign DecoupledStage_io_inp_valid = splitOut_io_out0_valid; // @[DecoupledStage.scala 31:20]
  assign DecoupledStage_io_inp_bits_0 = splitOut_io_out0_bits_0; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_io_inp_bits_1 = splitOut_io_out0_bits_1; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_io_inp_bits_2 = splitOut_io_out0_bits_2; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_io_inp_bits_3 = splitOut_io_out0_bits_3; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_io_inp_bits_4 = splitOut_io_out0_bits_4; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_io_inp_bits_5 = splitOut_io_out0_bits_5; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_io_inp_bits_6 = splitOut_io_out0_bits_6; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_io_inp_bits_7 = splitOut_io_out0_bits_7; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_io_out_ready = computeBest_io_out0_ready; // @[Clamper.scala 216:23]
  assign DecoupledStage_1_clock = clock;
  assign DecoupledStage_1_reset = reset;
  assign DecoupledStage_1_io_inp_valid = computeBest_io_obest_valid; // @[DecoupledStage.scala 31:20]
  assign DecoupledStage_1_io_inp_bits = computeBest_io_obest_bits; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_1_io_out_ready = subtractOut_io_obest_ready; // @[Clamper.scala 219:24]
  assign Queue_clock = clock;
  assign Queue_reset = reset;
  assign Queue_io_enq_valid = splitOut_io_out1_valid; // @[Decoupled.scala 295:22]
  assign Queue_io_enq_bits_0 = splitOut_io_out1_bits_0; // @[Decoupled.scala 296:21]
  assign Queue_io_enq_bits_1 = splitOut_io_out1_bits_1; // @[Decoupled.scala 296:21]
  assign Queue_io_enq_bits_2 = splitOut_io_out1_bits_2; // @[Decoupled.scala 296:21]
  assign Queue_io_enq_bits_3 = splitOut_io_out1_bits_3; // @[Decoupled.scala 296:21]
  assign Queue_io_enq_bits_4 = splitOut_io_out1_bits_4; // @[Decoupled.scala 296:21]
  assign Queue_io_enq_bits_5 = splitOut_io_out1_bits_5; // @[Decoupled.scala 296:21]
  assign Queue_io_enq_bits_6 = splitOut_io_out1_bits_6; // @[Decoupled.scala 296:21]
  assign Queue_io_enq_bits_7 = splitOut_io_out1_bits_7; // @[Decoupled.scala 296:21]
  assign Queue_io_deq_ready = subtractOut_io_out1_ready; // @[Clamper.scala 220:23]
  assign DecoupledStage_2_clock = clock;
  assign DecoupledStage_2_reset = reset;
  assign DecoupledStage_2_io_inp_valid = subtractOut_io_res_valid; // @[DecoupledStage.scala 31:20]
  assign DecoupledStage_2_io_inp_bits_0 = subtractOut_io_res_bits_0; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_2_io_inp_bits_1 = subtractOut_io_res_bits_1; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_2_io_inp_bits_2 = subtractOut_io_res_bits_2; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_2_io_inp_bits_3 = subtractOut_io_res_bits_3; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_2_io_inp_bits_4 = subtractOut_io_res_bits_4; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_2_io_inp_bits_5 = subtractOut_io_res_bits_5; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_2_io_inp_bits_6 = subtractOut_io_res_bits_6; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_2_io_inp_bits_7 = subtractOut_io_res_bits_7; // @[DecoupledStage.scala 32:19]
  assign DecoupledStage_2_io_out_ready = io_res_ready; // @[Clamper.scala 223:10]
endmodule
