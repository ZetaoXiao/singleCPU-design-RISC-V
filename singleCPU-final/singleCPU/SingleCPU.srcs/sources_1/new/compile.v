`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/14 22:56:09
// Design Name: 
// Module Name: compile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module compile(
    input clk,
    input reset,
    input rf_we_i,
    input [1:0]wd_sel_i,
    input [2:0]sext_op_i,
    input [24:0]instruction_i,
    input [31:0]npc_pc4_i,
    input [31:0]alu_c_i,
    input [31:0]dram_rd_i,
    output [31:0]sext_ext_o,
    output [31:0]rf_rd1_o,
    output [31:0]rf_rd2_o,
    output [31:0]wd,
    output [31:0]x19
    );
    //ÄÚ²¿ÐÅºÅ
    
    RF rf_compile(
    .clk    (clk),
    .reset  (reset), 
    .rf_we_i(rf_we_i), 
    .rR1_i  (instruction_i[12:8]), 
    .rR2_i  (instruction_i[17:13]), 
    .wR_i   (instruction_i[4:0]), 
    .wD_i   (wd), 
    .rD1_o  (rf_rd1_o), 
    .rD2_o  (rf_rd2_o),
    .x19    (x19)
    );
    SEXT SEXT_compile(
    .inst_i(instruction_i), 
    .sext_op_i(sext_op_i),
    .ext_o(sext_ext_o)
    );
    Wd_sel Wd_sel_compile(
    .wd_sel_i(wd_sel_i),
    .npc_pc4_i(npc_pc4_i),
    .alu_c_i(alu_c_i),
    .dram_rd_i(dram_rd_i),
    .sext_ext_i(sext_ext_o),
    .wd_o(wd)
    );
endmodule
