`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/14 22:55:13
// Design Name: 
// Module Name: fetch
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


module fetch(
    input clk,
    input reset,
    input [1:0]npc_op_i,
    input imm_sel_i,
    input [31:0]alu_c_i,
    input [31:0]sext_ext_i,
    output [31:0]pc,
    output [31:0] npc_pc4_o

    );
    //内部信号
    wire [31:0]imm_alu; //与门的输出
    wire [31:0]npc_imm;
    wire [31:0]npc;
    //调用各子模块
 
    //pc
    PC_m PC_fetch(
    .clk    (clk),
    .reset  (reset),
    .npc_i  (npc),
    .pc_o   (pc)
    );
    //npc
    NPC_m NPC_fetch(
    .imm_i      (npc_imm),
    .pc_i       (pc),
    .npc_op_i   (npc_op_i),
    .reset      (reset),
    .npc_o      (npc),
    .pc4_o      (npc_pc4_o)
    );
    //imm_sel
    IMM_sel IMM_sel_fetch(
    .imm_alu_i  (imm_alu),
    .sext_ext_i (sext_ext_i),
    .imm_sel_i  (imm_sel_i),
    .imm_o      (npc_imm)
    );
    //与门
    Jalr_sel Jal_selr_fetch(
    .alu_c_i    (alu_c_i),
    .imm_o  (imm_alu)
    );
endmodule
