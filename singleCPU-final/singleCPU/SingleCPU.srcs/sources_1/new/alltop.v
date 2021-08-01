`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/25 17:43:04
// Design Name: 
// Module Name: alltop
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


module alltop (
    input  wire clk,
    input  wire rst_n,
    output wire led0_en_o,
    output wire led1_en_o,
    output wire led2_en_o,
    output wire led3_en_o,
    output wire led4_en_o,
    output wire led5_en_o,
    output wire led6_en_o,
    output wire led7_en_o,
    output wire led_ca_o,
    output wire led_cb_o,
    output wire led_cc_o,
    output wire led_cd_o,
    output wire led_ce_o,
    output wire led_cf_o,
    output wire led_cg_o,
    output wire led_dp_o
);
    wire [31:0]x19;
    wire clk_cpu;
    wire clk_dispaly;
    reg [15:0]cnt = 0;
    //·ÖÆµ
    always@(posedge clk_cpu)
    begin
        if(cnt == 25000) cnt <=0;
        else cnt <= cnt + 1;
    end
    
    assign clk_display = cnt[14];
    
    
   cpuclk cpuclk_top(
   .clk_in1 (clk),
   .clk_out1 (clk_cpu)
   );  
   
    top top_cpu(
     .clk(clk_cpu),
     .rst_n(rst_n),
     .x19 (x19)          
 );
 
    display display_digital(
    .clk (clk_display),
    .rst_n(rst_n) ,
    .z1     (x19[31:24]) ,
    .r1     (x19[23:16])  ,
    .z2     (x19[15:8]),
    .r2     (x19[7:0]),
    .led0_en(led0_en_o),
    .led1_en(led1_en_o),
    .led2_en(led2_en_o),
    .led3_en(led3_en_o),
    .led4_en(led4_en_o),
    .led5_en(led5_en_o),
    .led6_en(led6_en_o),
    .led7_en(led7_en_o),
    .led_ca (led_ca_o),
    .led_cb (led_cb_o),
    .led_cc (led_cc_o),
    .led_cd (led_cd_o),
    .led_ce (led_ce_o),
    .led_cf (led_cf_o),
    .led_cg (led_cg_o),
    .led_dp (led_dp_o)
);
endmodule
