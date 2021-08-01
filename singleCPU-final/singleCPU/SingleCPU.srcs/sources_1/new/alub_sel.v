`timescale 1ns / 1ps

module alub_sel(
    input alub_sel_i,
    input [31:0]rf_rd2_i,
    input [31:0]sext_ext_i,
    output [31:0]alu_b_o
    );
    //若输入的控制信号alub_sel_i为1则选择rf_rd2，否则选择sext_ext
    assign alu_b_o =  alub_sel_i ? rf_rd2_i : sext_ext_i;
endmodule
