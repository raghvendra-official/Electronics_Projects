`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 16:57:07
// Design Name: 
// Module Name: tb_d_flip_flop
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


module tb_d_flip_flop;

  // Inputs
  reg D, clk, rst;
  // Outputs
  wire Q;

  // Instantiate the D flip-flop module
  d_flip_flop uut(
    .D(D),
    .clk(clk),
    .rst(rst),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Stimulus generation
  initial begin
    // Test case 1
    D = 0; rst = 0;
    #10; // Wait for 10 time units
    if (Q !== 0) $fatal("Test case 1 failed");

    // Test case 2
    D = 1; rst = 0;
    #10;
    if (Q !== 1) $fatal("Test case 2 failed");

    // Test case 3
    D = 0; rst = 1; // Apply reset
    #10;
    if (Q !== 0) $fatal("Test case 3 failed");

    // Test case 4
    D = 1; rst = 0; // Release reset
    #10;
    if (Q !== 1) $fatal("Test case 4 failed");

    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule