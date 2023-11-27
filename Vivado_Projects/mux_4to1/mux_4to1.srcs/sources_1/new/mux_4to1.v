`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 17:11:58
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1(
  input wire [3:0] data_in,  // 4-bit input data
  input wire [1:0] sel,      // 2-bit select signal
  output reg out              // Output
);

  always @* begin
    case (sel)
      2'b00: out = data_in[0];
      2'b01: out = data_in[1];
      2'b10: out = data_in[2];
      2'b11: out = data_in[3];
      default: out = 4'bxxxx; // Default case (should not occur)
    endcase
  end

endmodule
