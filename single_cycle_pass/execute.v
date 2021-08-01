`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/14 23:16:19
// Design Name: 
// Module Name: execute
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


module execute(
    input [2:0]alu_op_i,
    input alub_sel_i,
    input [31:0]alu_A_i,
    input [31:0]rf_rd2_i,
    input [31:0]sext_ext_i,
    output [31:0]alu_C_o
    );
     //ÄÚ²¿ÐÅºÅ
    wire [31:0]alu_b;
    
    ALU ALU_execute(
	.A_i       (alu_A_i),
	.B_i       (alu_b),
	.alu_op_i  (alu_op_i),
	.C_o       (alu_C_o)
    );
    
    alub_sel alub_sel_execute(
    .alub_sel_i     (alub_sel_i),
    .rf_rd2_i       (rf_rd2_i),
    .sext_ext_i     (sext_ext_i),
    .alu_b_o        (alu_b)
    );
endmodule
