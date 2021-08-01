`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/15 22:28:09
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst_n,
    output        debug_wb_have_inst,   // WB�׶��Ƿ���ָ�� (�Ե�����CPU����flag��Ϊ1)
    output [31:0] debug_wb_pc,          // WB�׶ε�PC (��wb_have_inst=0�������Ϊ����ֵ)
    output        debug_wb_ena,         // WB�׶εļĴ���дʹ�� (��wb_have_inst=0�������Ϊ����ֵ)
    output [4:0]  debug_wb_reg,         // WB�׶�д��ļĴ����� (��wb_ena��wb_have_inst=0�������Ϊ����ֵ)
    output [31:0] debug_wb_value        // WB�׶�д��Ĵ�����ֵ (��wb_ena��wb_have_inst=0�������Ϊ����ֵ)
);

    wire [31:0] instruction;
    wire [31:0] dram_rd;
    wire [31:0] pc;
    wire dram_we;
    wire rf_we;
    wire [31:0]alu_c;
    wire [31:0]rf_rd2;
    wire [31:0]wd;
    wire [13:0]addr;
    wire [4:0]wr;
    assign wr = instruction[11:7];
    
    assign addr = alu_c[17:2];  
    assign debug_wb_have_inst = 'b1;
    assign debug_wb_pc = pc;
    assign debug_wb_ena = rf_we;
    assign debug_wb_reg = wr;
    assign debug_wb_value = wd;
    
miniRV miniRV_u (
    .clk  (clk),
    .reset  (~rst_n),
    .instruction (instruction),
    .dram_rd (dram_rd), 
    .pc (pc),
    .dram_we (dram_we),
    .alu_c (alu_c),
    .rf_rd2 (rf_rd2),
    .rf_we (rf_we),
    .wd (wd)
);

// ��������ģ�飬ֻ��Ҫʵ���������ߣ�����Ҫ����ļ�
inst_mem imem(
       .a(pc[15:2]),   // input wire [13:0] a
       .spo(instruction)   // output wire [31:0] spo
);

data_mem dmem(
    .clk(clk),            // input wire clka
    .a(addr),     // input wire [13:0] addra
    .d(rf_rd2),        // output wire [31:0] douta
    .we(dram_we),          // input wire [0:0] wea
    .spo(dram_rd)        // input wire [31:0] dina
);
endmodule
