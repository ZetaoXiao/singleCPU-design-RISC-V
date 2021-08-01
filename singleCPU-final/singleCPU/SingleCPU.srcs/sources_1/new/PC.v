`timescale 1ns / 1ps



module PC_m(
	input clk,
	input reset,
	input [31:0]npc_i,
	output reg [31:0]pc_o
);
//	initial begin 
//		pc_o = 32'd0; 
//	end
	//时钟上升沿更新PC
	reg cnt = 0;
	always@(posedge clk)begin
		if(reset) begin  //重置则归�?
			pc_o <= 32'd0;
		end
		else begin 
		    if(cnt ==0)
		     begin cnt = 1 ; end
			else
			 begin pc_o <= npc_i; end
		end
	end
endmodule
