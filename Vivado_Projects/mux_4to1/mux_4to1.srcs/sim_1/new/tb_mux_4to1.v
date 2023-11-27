`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 17:12:28
// Design Name: 
// Module Name: tb_mux_4to1
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


module tb_mux_4to1;

  // Inputs
  reg [3:0] data_in;
  reg [1:0] sel;
  // Outputs
  wire out;

  // Instantiate the 4-to-1 multiplexer module
  mux_4to1 uut(
    .data_in(data_in),
    .sel(sel),
    .out(out)
  );

  // Stimulus generation
  initial begin
    // Test case 1
    data_in = 4'b0000; sel = 2'b00;
    #10; // Wait for 10 time units
    if (out !== 1'b0) $fatal("Test case 1 failed");

    // Test case 2
    data_in = 4'b1010; sel = 2'b01;
    #10;
    if (out !== 1'b0) $fatal("Test case 2 failed");

    // Test case 3
    data_in = 4'b1100; sel = 2'b10;
    #10;
    if (out !== 1'b1) $fatal("Test case 3 failed");

    // Test case 4
    data_in = 4'b0111; sel = 2'b11;
    #10;
    if (out !== 1'b1) $fatal("Test case 4 failed");

    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule