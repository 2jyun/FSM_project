`timescale 1ns / 1ps

module fsm(a, clk, rst, red, green, yellow);

    input a;
    input clk;
    input rst;
    output red;
    output green;
    output yellow;

    reg red, green, yellow;
    reg [2:0] current_state;
    
    clock_divider U1 (.clk(clk), .clk_out(clk_div), .rst(rst));    
    
    //상태 전이 로직
    always @(posedge clk or posedge rst) begin
        if(rst)begin
            red =0;
            green=0;
            yellow=0;
            current_state=3'b000;
        end
        else begin
            case(current_state)
                3'b000 : begin  
                            current_state <= 3'b001;
                        end
                3'b001 : begin if(!a) begin
                        current_state <= 3'b010;
                        end
                        else begin
                            current_state <= 3'b001;
                        end 
                    end
                3'b010 :begin if(!a) begin
                            current_state <= 3'b000;
                        end
                        else begin
                            current_state <= 3'b001;
                        end
                    end
            endcase
        end    
    end
    
//상태 출력 로직
    always @(posedge clk) begin
        case(current_state)
            3'b000 :begin
                {green, yellow, red} = 3'b100;
                end
            3'b001 : begin
                {green, yellow, red} = 3'b010;
                end
            3'b010 : begin
                {green, yellow, red} = 3'b001;
                end
        endcase    
    end
endmodule




