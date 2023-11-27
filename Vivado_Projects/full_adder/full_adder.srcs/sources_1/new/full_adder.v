`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 16:40:38
// Design Name: 
// Module Name: full_adder
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


module full_adder(
  input A, // First input bit
  input B, // Second input bit
  input Cin, // Carry input
  output Sum, // Sum output
  output Cout // Carry output
);

  assign Sum = A ^ B ^ Cin; // Sum output
  assign Cout = (A & B) | (B & Cin) | (A & Cin); // Carry output

endmodule
