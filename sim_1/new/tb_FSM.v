`timescale 1ns / 1ps

module tb_fsm();
    wire green;
    wire red;
    wire yellow;
    reg a;
    reg clk;
    reg rst;

    fsm U0 (.a(a), .clk(clk), .rst(rst), .green(green), .red(red), .yellow(yellow));
    
    always #10 clk = ~clk;
    initial begin
        a=0;
        clk=0;
        rst=1;
        #5 rst = 0;
    end
    initial begin
        #100 a <= ~a;
        #100 a <= ~a;
        repeat(3)@(posedge clk); //클럭의 6주기 이후 종료
        $finish;
    end

    initial begin //Tcl Console에서 동작 모니터링
        $display("Test Start");
        $monitor($time, " ns: Green Signal : %d, Yellow Signal : %d, Red Signal : %d", green, yellow, red);
    end
endmodule

