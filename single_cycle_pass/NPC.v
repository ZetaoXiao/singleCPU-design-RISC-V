`timescale 1ns / 1ps


module NPC_m(
    input [31:0]imm_i,
    input [31:0]pc_i,
    input [1:0]npc_op_i,
    input reset,
    output reg[31:0]npc_o,
    output reg[31:0]pc4_o
    );
    `include "param.v"
//	initial begin 	//	初始状�?�置0，也可以通过调整初始电位得到
//		npc_o = 32'd0; pc4_o = 32'd0; 
//	end
	
    always@(*)
        begin
			if(reset)
			begin   //高电平重�?
				npc_o = 0;
			end
			else begin  //判断NPC模块的输�?
				case(npc_op_i)
					`PC4:	npc_o = pc_i + 3'b100;  //正常输出PC+4
					`Btype_npc: npc_o = pc_i + imm_i;
					`JAL: 							//两个J指令的处�?
						begin
							npc_o = pc_i + imm_i;
							pc4_o = pc_i + 3'b100;
						end
					`JALR:
						begin
							npc_o = imm_i;
							pc4_o = pc_i +	3'b100;
						end
					default: begin 
					   npc_o = 0;
					   pc4_o = pc_i +	3'b100;
					   end
				endcase
			end
		end
endmodule
