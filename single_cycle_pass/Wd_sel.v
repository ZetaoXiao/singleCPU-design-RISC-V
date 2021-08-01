`timescale 1ns / 1ps

module Wd_sel(
    input [1:0]wd_sel_i,
    input [31:0]npc_pc4_i,
    input [31:0]alu_c_i,
    input [31:0]dram_rd_i,
    input [31:0]sext_ext_i,
    output reg[31:0]wd_o
    );
    `include "param.v"
//    initial begin 
//		wd_o = 32'd0;   //初始状�?�置0
//	end
    always@(*)
        begin
			case(wd_sel_i)  //根据选择的数值判断wd的读�?
				`ALU_C: 	wd_o = alu_c_i;
				`Jtype_wd: 	wd_o = npc_pc4_i;
				`LW_wd: 	wd_o = dram_rd_i;
				`LUI_wd: 	wd_o = sext_ext_i;
			endcase
		end
endmodule
