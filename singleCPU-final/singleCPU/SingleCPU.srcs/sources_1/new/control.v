`timescale 1ns / 1ps

//控制单元
module control(
    input [6:0]op_i,
    input [2:0]func3_i,
    input [6:0]func7_i,
    input [31:0]alu_c_i,  //用这个取代branch
    output reg[2:0]sext_op_o,
    output imm_sel_o,
    output reg[1:0]npc_op_o,
    output reg[1:0]wd_sel_o,
    output rf_we_o,
    output alub_sel_o,
    output reg[2:0]alu_op_o,
    output dram_we_o
    );
    `include "param.v"
	
//先将�?些�?�辑计算之外的指令进行铺�?
	//如果是jalr指令immsel 0 否则就是立即数类型置0
	assign imm_sel_o = (op_i == 7'b1100111) ? 1'b1 : 1'b0;
	//如果是sw/b类型就置�?
	assign rf_we_o = (op_i == 7'b0100011)||(op_i == 7'b1100011)? 1'b0 : 1'b1;
	//如果是R/B指令alub就�?�择rs2
	assign alub_sel_o = (op_i == 7'b0110011)||(op_i == 7'b1100011)?1'b1 : 1'b0;
	//如果是sw指令就写入dram
	assign dram_we_o = (op_i == 7'b0100011)?1'b1 : 1'b0;
	
	
//wd_sel模块选择
	always@(*)
		begin
			case(op_i)
				'b1101111: wd_sel_o =`Jtype_wd;
				'b1100111: wd_sel_o =`Jtype_wd;
				'b0000011: wd_sel_o =`LW_wd;
				'b0110111: wd_sel_o =`LUI_wd;
				default:   wd_sel_o =`ALU_C;
			endcase
		end
	always@(*)
	   begin
	       case(op_i)
	           'b1101111: npc_op_o = `JAL;
	           'b1100111: npc_op_o = `JALR;
	     	   'b1100011:   
					begin
						if(func3_i == 3'b000 && alu_c_i == 0)
							begin npc_op_o = `Btype_npc; end
						else if(func3_i == 3'b001 && alu_c_i != 0)
							begin npc_op_o = `Btype_npc; end
						else if(func3_i == 3'b100 && alu_c_i[31] == 1)
							begin npc_op_o = `Btype_npc; end
						else if(func3_i == 3'b101 && alu_c_i[31] != 1)
							begin npc_op_o = `Btype_npc; end
						else
							begin npc_op_o = `PC4; end
					end
	           default: npc_op_o = `PC4;
	       endcase
	   end
	
//sext模块选择
	always@(*)  
		begin
			case(op_i)
				'b0010011: 
					begin
						if(func3_i == 'b001 || func3_i == 'b101)
							begin
								sext_op_o = `I2Type;
							end
						else 	sext_op_o = `I1Type;
					end
				'b0100011: sext_op_o = `SWType;
				'b1100011: sext_op_o = `BType_sext;
				'b0110111: sext_op_o = `LUIType;
				'b1101111: sext_op_o = `JALType;
				default:   sext_op_o = `I1Type;  //lw/jalr
			endcase
		end
	
//ALU模块根据OP/func3_i/func7_i按顺序�?�择	  逻辑按给出的指令总表 �?些宏定义砍名字可知，数�?�在参数�?(ALU模块的参数表还没写，但大致�?�辑顺序即为定义�?)
	always@(*)
		begin
			case(op_i)   
				'b0110011:  //寄存器类
					begin
						case(func3_i)
							'b000:  
								begin 
									if(func7_i == 'b0000000)
									begin 
										alu_op_o = `ADD;
									end
									if(func7_i == 'b0100000)
									begin
										alu_op_o = `SUB;
									end
								end
							'b111:   alu_op_o = `AND;
							'b110:   alu_op_o = `OR;
							'b100:   alu_op_o = `XOR;
							'b001:   alu_op_o = `SLL;
							'b101:
								begin
									if(func7_i == 'b0000000)
									begin 
										alu_op_o = `SRL;
									end
									if(func7_i == 'b0100000)
									begin
										alu_op_o = `SRA;
									end
								end
						endcase
					end
				'b0010011: //立即数类
					begin
						case(func3_i)
							'b000:  	alu_op_o = `ADD;
							'b111:   alu_op_o = `AND;
							'b110:   alu_op_o = `OR;
							'b100:   alu_op_o = `XOR;
							'b001:   alu_op_o = `SLL;
							'b101:
								begin
									if(func7_i == 'b0000000)
									begin 
										alu_op_o = `SRL;
									end
									if(func7_i == 'b0100000)
									begin
										alu_op_o = `SRA;
									end
								end
						endcase
					end
				'b0000011:	alu_op_o = `ADD;  //lw
				'b1100111:
				        alu_op_o = `ADD;  // jalr
				'b0100011:	alu_op_o = `ADD;  // sw
				'b1100011:  alu_op_o = `SUB; //
			endcase
		end
endmodule
										
							
				
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

