`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/14 21:53:42
// Design Name: 
// Module Name: miniRV
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


module miniRV(
    input clk,
    input reset,
    input [31:0]instruction,
    input [31:0]dram_rd,
    output [31:0]pc,
    output dram_we,
    output [31:0]alu_c,
    output [31:0]rf_rd2,
    output rf_we,
    output [31:0]wd,
    output [31:0]x19
    );
    
    wire [1:0]npc_op;
    wire imm_sel;
    wire alub_sel;
    wire [31:0]sext_ext;
    wire [31:0]npc_pc4;
    wire [1:0]wd_sel;
    wire [2:0]sext_op;
    wire [2:0]alu_op;
    wire [31:0]rf_rd1;

    
    fetch fetch_miniRV(
    .clk        (clk), 
    .reset        (reset),
    .npc_op_i     (npc_op), 
    .imm_sel_i    (imm_sel),
    .alu_c_i      (alu_c),
    .sext_ext_i   (sext_ext),
    .pc (pc),
    .npc_pc4_o    (npc_pc4)
);

    compile compile_miniRV(
    .clk          (clk),
    .reset        (reset),
    .rf_we_i      (rf_we),
    .wd_sel_i     (wd_sel),
    .instruction_i(instruction[31:7]),
    .npc_pc4_i    (npc_pc4),
    .alu_c_i      (alu_c),
    .dram_rd_i    (dram_rd),
    .sext_op_i    (sext_op),
    .sext_ext_o   (sext_ext),
    .rf_rd1_o     (rf_rd1),
    .rf_rd2_o     (rf_rd2),
    .wd           (wd),
    .x19          (x19)
    );
    
    execute execute_miniRV(
    .alu_op_i     (alu_op),
    .alub_sel_i   (alub_sel),
    .alu_A_i     (rf_rd1),
    .rf_rd2_i     (rf_rd2),
    .sext_ext_i   (sext_ext),
    .alu_C_o      (alu_c)
    );
    
    control control_miniRV(
    .op_i           (instruction[6:0]),
    .func3_i        (instruction[14:12]),
    .func7_i        (instruction[31:25]),
    .alu_c_i        (alu_c),
    .sext_op_o      (sext_op),
    .imm_sel_o      (imm_sel),
    .npc_op_o       (npc_op),
    .wd_sel_o       (wd_sel),
    .rf_we_o        (rf_we),
    .alub_sel_o     (alub_sel),
    .alu_op_o       (alu_op),
    .dram_we_o      (dram_we)
    );
endmodule
