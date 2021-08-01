`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/25 19:57:43
// Design Name: 
// Module Name: test
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


module test(
    );
    reg clk = 0;
    reg rst_n = 0;
    wire led0_en_o;
    wire led1_en_o;
    wire led2_en_o;
    wire led3_en_o;
    wire led4_en_o;
    wire led5_en_o;
    wire led6_en_o;
    wire led7_en_o;
    wire led_ca_o ;
    wire led_cb_o ;
    wire led_cc_o ;
    wire led_cd_o ;
    wire led_ce_o ;
    wire led_cf_o ;
    wire led_cg_o ;
    wire led_dp_o ;


    
alltop alltop_u(
.clk  (clk ),
.rst_n(rst_n),
.led0_en_o(led0_en_o),
.led1_en_o(led1_en_o),
.led2_en_o(led2_en_o),
.led3_en_o(led3_en_o),
.led4_en_o(led4_en_o),
.led5_en_o(led5_en_o),
.led6_en_o(led6_en_o),
.led7_en_o(led7_en_o),
.led_ca_o(led_ca_o),
.led_cb_o(led_cb_o),
.led_cc_o(led_cc_o),
.led_cd_o(led_cd_o),
.led_ce_o(led_ce_o),
.led_cf_o(led_cf_o),
.led_cg_o(led_cg_o),
.led_dp_o(led_dp_o)




);

initial begin
#10000 rst_n = 1;
end
always begin
#10 clk = ~clk;
end
endmodule
