`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 16:41:13
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder;

  // Inputs
  reg A, B, Cin;
  // Outputs
  wire Sum, Cout;

  // Instantiate the full adder module
  full_adder uut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Stimulus generation
  initial begin
    // Test case 1
    A = 0; B = 0; Cin = 0;
    #10; // Wait for 10 time units
    // Check the result
    if (Sum !== 0 || Cout !== 0) $fatal("Test case 1 failed");

    // Test case 2
    A = 1; B = 0; Cin = 0;
    #10;
    if (Sum !== 1 || Cout !== 0) $fatal("Test case 2 failed");

    // Test case 3
    A = 0; B = 1; Cin = 0;
    #10;
    if (Sum !== 1 || Cout !== 0) $fatal("Test case 3 failed");

    // Test case 4
    A = 1; B = 1; Cin = 0;
    #10;
    if (Sum !== 0 || Cout !== 1) $fatal("Test case 4 failed");

    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule

