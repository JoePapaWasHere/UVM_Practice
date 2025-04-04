// Author: JP3
// Initial Creation: 4/3/2025
// File Name: E1.sv
// Description: Excersice 1 of Udemy Course
// Revision History
// 20250403: JP3 Created

`timescale 1ns / 1ps

module tb();
  // global signals are mostly generate in the testbench top
  // clock and reset
  
  logic clk;
  logic rst;
  
  logic [3:0] temp;
  
  // Different Uses of Initial Blocks in Testbenchs
  //1. Initialize Global Variables such as clock and resets
  initial begin
    clk = 1'b0;
    rst = 1'b0;
  end
  
  //30 ns rst signal
  initial begin
    rst = 1'b1;
    #30;
    rst = 1'b0;
  end
  // 2. Generate random signals for data and control
  initial begin
    temp = 4'b0010;
    #10; // 10ns delay because timescale is 1ns
    temp = 4'b1100;
    #10;
    temp = 4'b0011;
    #10;
  end
  
  // 3. System Task at the start of simulation
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  // 4. Analyze the values of variables on console
  initial begin
    $monitor("Temp : %0d at time %0t", temp, $time);
  end
  
  // 5. Call the finish (finish after 200ns)
  initial begin
    #200;
    $finish();
  end
  
endmodule