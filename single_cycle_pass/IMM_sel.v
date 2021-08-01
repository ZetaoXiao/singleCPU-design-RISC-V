`timescale 1ns / 1ps

module IMM_sel(
    input [31:0]imm_alu_i,
    input [31:0]sext_ext_i,
    input imm_sel_i,
    output [31:0]imm_o
    );
    //若输入imm_sel�?1选择alu_c，否则�?�择sext_ext
    assign imm_o =  imm_sel_i ? imm_alu_i : sext_ext_i;

endmodule
