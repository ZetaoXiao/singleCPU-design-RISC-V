
`define CPU_PARAM


//宏定�?

//给NPC的控制信�?
`define PC4             'b00
`define Btype_npc     	'b01
`define JAL           	'b10
`define JALR          	'b11

//给SEXT的控制信�?
`define I1Type		  	'b000
`define I2Type		  	'b001
`define SWType		   	'b010
`define BType_sext	   	'b011
`define LUIType		  	'b100
`define JALType		   	'b101

//给Wd_sel的控制信�?
`define ALU_C		   	'b00
`define Jtype_wd	   	'b01
`define LW_wd		   	'b10
`define LUI_wd		   	'b11
 
//给ALU的�?�辑运算信号
`define ADD				'b000
`define SUB				'b001
`define AND				'b010
`define OR				'b011
`define XOR				'b100
`define SLL				'b101
`define SRL				'b110
`define SRA				'b111