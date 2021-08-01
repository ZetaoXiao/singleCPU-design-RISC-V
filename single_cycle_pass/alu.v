`timescale 1ns / 1ps
module ALU(
	input [31:0]A_i,
	input [31:0]B_i,
	input [2:0]alu_op_i,
	output reg [31:0]C_o
);
    `include "param.v"
	initial begin  C_o = 32'd0;end
 reg [31:0]temp;
 reg [31:0]temp2;
    always@(*)
        begin
			case(alu_op_i)
				`ADD:		C_o = A_i + B_i;
				`SUB:		C_o = A_i + (~B_i+1);
				`AND:		C_o = A_i & B_i;
				`OR:		C_o = A_i | B_i;
				`XOR:		C_o = A_i ^ B_i;
				`SLL:		
            begin
              if(B_i[31] == 'b1)
                begin
                  temp = ~(B_i - 1);  //将补码转换成原码
                  temp2 = (32'd32 - (temp % 32'd32))%32'd32;  
                  C_o = A_i << temp2;   
                end
              else
                begin
                  temp2 = B_i % 32'd32; 
                  C_o = A_i << temp2;
                end
            end
				`SRL:		
         begin
            //如果最高位是1代表是负数
            if(B_i[31] == 'b1)
            begin
              temp = ~(B_i - 1);  //将补码转换成原码
              temp2 = (32'd32 - (temp % 32'd32))%32'd32;  
              C_o = A_i >> temp2;   
            end
            else
            begin
              temp2 = B_i % 32'd32; 
              C_o = A_i >> temp2;
            end
        end
				`SRA:	
         begin
            //如果最高位是1代表是负数
            if(B_i[31] == 'b1)
            begin
              temp = ~(B_i - 1);  //将补码转换成原码
              temp2 = (32'd32 - (temp % 32'd32))%32'd32;  
              C_o = ($signed(A_i)) >>> temp2;   
            end
            else
            begin
              temp2 = B_i % 32'd32; 
              C_o = ($signed(A_i)) >>> temp2;
            end
        end 
			endcase
		end
endmodule