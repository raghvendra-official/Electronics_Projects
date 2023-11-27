`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 16:56:36
// Design Name: 
// Module Name: d_flip_flop
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


module d_flip_flop(
  input D,  // Data input
  input clk, // Clock input
  input rst, // Reset input
  output reg Q // Output
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      Q <= 0; // Reset the flip-flop
    end else begin
      Q <= D; // Update Q with the input data on the rising edge of the clock
    end
  end

endmodule