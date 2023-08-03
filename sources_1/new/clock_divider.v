`timescale 1ns / 1ps

module clock_divider(clk, rst, clk_out);
    input clk;
    input rst;
    output clk_out;
    reg clk_out;
    reg [31:0] cnt;
    parameter factor = 25_000_000; //분주 비율  
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            clk_out = 0;
            cnt = 0;
        end
        else begin
            if(cnt == (factor-1))begin
                clk_out <= ~clk_out;
                cnt = 0;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
        end
    end
endmodule
