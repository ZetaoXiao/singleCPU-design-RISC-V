`timescale 1ns / 1ps


module Jalr_sel(
    input [31:0]alu_c_i,
    output [31:0]imm_o
    );
    assign imm_o = alu_c_i & ~1;
endmodule
