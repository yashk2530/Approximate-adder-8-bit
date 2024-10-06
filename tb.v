`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2024 02:48:02 AM
// Design Name: 
// Module Name: tb
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


module tb();
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] s;
    wire [8:0]sc;
    wire cout;
    finaladder fa1(.A(a),.B(b),.sum(s), .sumc(sc), .coutf1(cout)  );
    initial 
    begin
    a=0; b=0;
        #10 a= 8'b11101101; b = 8'b01101101;
        #10 a= 8'b11011110; b = 8'b11000010;
        #10 a= 8'b11011110; b = 8'b11011000;
        #10 a= 8'b11101000; b = 8'b10110011;
        #10 a= 8'b10111001; b = 8'b11101101;
       
 end
    
endmodule
