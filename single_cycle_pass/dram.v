`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/14 23:45:58
// Design Name: 
// Module Name: dram
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


module dram (
    input           clk,
    input   [31:0]  addr_i,     // 来源于执行单元计算出的访存地址
    output  [31:0]  rd_data_o,  // 从存储器中获得的数据
    input           memwr_i,    // 来自控制单元的写使能信号
    input   [31:0]  wr_data_i   // 来自译码单元的rd_data2 (S型指令的rs2寄存器的值)
);
// 64KB DRAM
dram32 U_dram (
    .clk    (clk),            // input wire clka
    .a      (addr_i[15:2]),     // input wire [13:0] addra
    .qspo   (rd_data_o),        // output wire [31:0] douta
    .we     (memwr_i),          // input wire [0:0] wea
    .d      (wr_data_i)         // input wire [31:0] dina
);

endmodule
