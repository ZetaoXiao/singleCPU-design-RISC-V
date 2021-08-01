`timescale 1ns / 1ps

module RF(
	input clk,
	input reset,
	input rf_we_i,
	input [4:0]rR1_i,
	input [4:0]rR2_i,
	input [4:0]wR_i,
	input [31:0]wD_i,
	output [31:0]rD1_o,
	output [31:0]rD2_o
);

	reg [31:0]register[0:31];  //设置32�?32位的寄存器堆 初始�?0
	assign rD1_o = (rR1_i != 0) ? register[rR1_i] : 32'd0;  //读寄存器
	assign rD2_o = (rR2_i != 0) ? register[rR2_i] : 32'd0;
	always@(posedge clk) begin   //写寄存器
		if(reset)begin  //寄存器堆�?0
			register[0] <= 0; register[1] <= 0; register[2] <= 0; register[3] <= 0;
            register[4] <= 0; register[5] <= 0; register[6] <= 0; register[7] <= 0;
            register[8] <= 0; register[9] <= 0; register[10] <= 0; register[11] <= 0;
            register[12] <= 0; register[13] <= 0; register[14] <= 0; register[15] <= 0;
            register[16] <= 0; register[17] <= 0; register[18] <= 0; register[19] <= 0; 
            register[20] <= 0; register[21] <= 0; register[22] <= 0; register[23] <= 0; 
            register[24] <= 0; register[25] <= 0; register[26] <= 0; register[27] <= 0;
            register[28] <= 0; register[29] <= 0; register[30] <= 0; register[31] <= 0;
		end  
		else if(rf_we_i) register[wR_i] <= wD_i;  //写入信号使能则写�?
		register[0] <= 0; //0号寄存器始终�?0 zero
	end 

endmodule
