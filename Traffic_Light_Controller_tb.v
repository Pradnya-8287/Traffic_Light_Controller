`timescale 1ns/ 1ps
`include "Traffic_Light_Controller.v"

module Traffic_Light_Controller_tb;

    reg clk, rst;
    wire [2:0]light_M1;
    wire [2:0]light_M2;
    wire [2:0]light_MT;
    wire [2:0]light_S;

    wire [3:0] count;
    wire [2:0] ps;

    Traffic_Light_Controller DUT (
        .clk(clk),
        .rst(rst),
        .light_M1(light_M1),
        .light_M2(light_M2),
        .light_MT(light_MT),
        .light_S(light_S)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10 ns clock period
    end

    initial begin
        rst = 1;
        #10 rst = 0;             // release reset
        #1000 $finish;           // stop simulation after 1000 ns
    end

    initial begin 
        $dumpfile("Traffic_Light_Controller.vcd");
        $dumpvars(0, Traffic_Light_Controller_tb);

        $display ("Time\t|\tM1\tM2\tMT\tS");
        $monitor("%0dns\t|\t%b\t%b\t%b\t%b", $time, light_M1, light_M2, light_MT, light_S);
    end
endmodule
