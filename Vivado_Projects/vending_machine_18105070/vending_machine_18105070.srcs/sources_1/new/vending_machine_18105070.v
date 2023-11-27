`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2023 18:12:32
// Design Name: 
// Module Name: vending_machine_18105070
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


module vending_machine_18105070(
    input clk,
    input rst,
    input [1:0] in, // 01 = 5 rs, 10 = 10 rs
    output reg out,
    output reg [1:0] change
);

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;

reg [1:0] c_state, n_state;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        c_state <= s0;
        n_state <= s0;
        change <= 2'b00;
        out <= 0;
    end
    else
    begin
        c_state <= n_state;

        case (c_state)
            s0: // state 0 : 0 rs
                case (in)
                    2'b00:
                        begin
                            n_state = s0;
                            out = 0;
                            change = 2'b00;
                        end
                    2'b01:
                        begin
                            n_state = s1;
                            out = 0;
                            change = 2'b00;
                        end
                    2'b10:
                        begin
                            n_state = s2;
                            out = 0;
                            change = 2'b00;
                        end
                endcase

            s1: // state 1 : 5 rs
                case (in)
                    2'b00:
                        begin
                            n_state = s0;
                            out = 0;
                            change = 2'b01; // change returned 5 rs
                        end
                    2'b01:
                        begin
                            n_state = s2;
                            out = 0;
                            change = 2'b00;
                        end
                    2'b10:
                        begin
                            n_state = s0;
                            out = 1;
                            change = 2'b00;
                        end
                endcase

            s2: // state 2 : 10 rs
                case (in)
                    2'b00:
                        begin
                            n_state = s0;
                            out = 0;
                            change = 2'b10;
                        end
                    2'b01:
                        begin
                            n_state = s0;
                            out = 1;
                            change = 2'b00;
                        end
                    2'b10:
                        begin
                            n_state = s0;
                            out = 1;
                            change = 2'b01; // change returned 5 rs and 1 bottle
                        end
                endcase
        endcase
    end
end

endmodule

