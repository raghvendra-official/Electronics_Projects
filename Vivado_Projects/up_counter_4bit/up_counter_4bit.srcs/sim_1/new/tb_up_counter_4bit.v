`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 17:06:32
// Design Name: 
// Module Name: tb_up_counter_4bit
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


module tb_up_counter_4bit;

  // Inputs
  reg clk, rst;
  // Outputs
  wire [3:0] count;

  // Instantiate the 4-bit up-counter module
  up_counter_4bit uut(
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Stimulus generation
  initial begin
    // Apply reset
    rst = 1;
    #10; // Wait for 10 time units
    rst = 0; // Release reset

    // Test the counter for a few clock cycles
    #20; // Wait for 20 time units
    if (count !== 4'b0001) $fatal("Test case 1 failed");

    #20;
    if (count !== 4'b0010) $fatal("Test case 2 failed");

    #20;
    if (count !== 4'b0011) $fatal("Test case 3 failed");

    #20;
    if (count !== 4'b0100) $fatal("Test case 4 failed");

    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule
