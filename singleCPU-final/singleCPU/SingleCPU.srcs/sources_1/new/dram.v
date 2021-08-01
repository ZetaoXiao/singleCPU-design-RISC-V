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
    input   [31:0]  addr_i,     // ��Դ��ִ�е�Ԫ������ķô��ַ
    output  [31:0]  rd_data_o,  // �Ӵ洢���л�õ�����
    input           memwr_i,    // ���Կ��Ƶ�Ԫ��дʹ���ź�
    input   [31:0]  wr_data_i   // �������뵥Ԫ��rd_data2 (S��ָ���rs2�Ĵ�����ֵ)
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
