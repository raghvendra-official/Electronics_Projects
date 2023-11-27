`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 17:05:32
// Design Name: 
// Module Name: up_counter_4bit
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


module up_counter_4bit(
  input wire clk,  // Clock input
  input wire rst,  // Reset input
  output reg [3:0] count // 4-bit counter output
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 4'b0000; // Reset the counter to 0
    end else begin
      count <= count + 1; // Increment the counter on the rising edge of the clock
    end
  end

endmodule
