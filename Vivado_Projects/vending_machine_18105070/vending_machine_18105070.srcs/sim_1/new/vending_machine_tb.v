`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2023 05:19:06
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb;
  reg [9:0]amount;
  reg [9:0]rem_amount;
  reg enter;
  reg [3:0]choice;
  reg [1:0]select;
  reg clk;
  reg reset;
  reg cancel;
  wire [9:0]change;
  wire item;
  wire [9:0]back_amount;
  wire[0:3] St;
  
vending_machine vending_dut(
  .amount(amount),
  .rem_amount(rem_amount),
  .enter(enter),
  .choice(choice),
  .select(select),
  .clk(clk),
  .reset(reset),
  .cancel(cancel),
  .change(change),
  .item(item),
  .back_amount(back_amount),
  .St(St)
    );
  
 initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #10000 
  $finish;
end   
  
always #5 clk = ~clk; // Clock generation 
  initial begin
  amount=0;
  rem_amount=0;
  enter=0;
  choice=0;
  select=0;
  cancel=0;
  clk = 0;
  reset = 1;
#10 reset = 0; 
    
//TestCase1:
#10 amount=30;
#10
#10 select=2'b01;
#15 choice=5;
    enter=1;
#10 enter=0;
#20 amount=0;
    select=0;
#15
    
//TestCase2:
#10 amount=55;
#10
#10 select=2'b10;
#15 choice=5;
    enter=1;
#10 enter=0;
#20 amount=0;
    select=0;
#25
    
//TestCase3:
#10 amount=30;
#10
#10 select=2'b10;
#15 choice=5;
    enter=1;
#10 enter=0;
    rem_amount=30;
#30
#20 amount=0;
    select=0;
#25
    
//TestCase4:
#10 amount=30;
#10
#10 select=2'b01;
#15 choice=5;
    enter=1;
#10 enter=0;
#20 amount=0;
    select=0;
#15

//TestCase5:
#10 amount=30;
#10
#10 select=2'b01;
#15 choice=5;
    enter=1;
#10 enter=0;
#20 amount=0;
    select=0;
#15
    
$finish;
end
 
endmodule
