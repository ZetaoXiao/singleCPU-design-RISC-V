`timescale 1ns / 1ps

module SEXT(
    input [24:0]inst_i,//IROM.inst[31:7]
    input [2:0]sext_op_i,
    output reg[31:0]ext_o
    );
    `include "param.v"
	initial begin 
				ext_o = 32'd0; 
			end
	
    always@(*)
        begin
			case(sext_op_i)
				`I1Type: 		ext_o = {{20{inst_i[24]}},inst_i[24:13]}; //addi等I1类型指令
				`I2Type: 		ext_o = {{27{inst_i[24]}},inst_i[17:13]}; //位移等I2类型指令
				`SWType: 		ext_o = {{20{inst_i[24]}},inst_i[24:18],inst_i[4:0]}; //sw指令[31:25]+[11:7]
				`BType_sext:	ext_o = {{19{inst_i[24]}},inst_i[24],inst_i[0],inst_i[23:18],inst_i[4:1],1'b0}; //B类型 12|[10:5]|[4:11]|11
				`LUIType:		ext_o = inst_i[24:5]<<'d12;     // Lui[31:12]
				`JALType:   	ext_o = {{11{inst_i[24]}},inst_i[24],inst_i[12:5],inst_i[13],inst_i[23:14],1'b0}; //Jal指令
			endcase
		end

endmodule
