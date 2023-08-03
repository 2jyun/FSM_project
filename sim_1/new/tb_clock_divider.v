`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/13 23:29:56
// Design Name: 
// Module Name: tb_clock_divider
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


module tb_clock_divider(
    );
    reg clk;
    reg rst;
    wire clk_out;
    wire [31:0] cnt;
    clock_divider UUT(.clk(clk), .rst(rst), .clk_out(clk_out), .cnt(cnt));
    initial begin
        clk <= 1; //default Value
        rst <= 0;
    end
    always #10 clk =~clk;
endmodule
