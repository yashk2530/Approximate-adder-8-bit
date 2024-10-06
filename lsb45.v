`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2024 02:19:09 AM
// Design Name: 
// Module Name: lsb45
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

module lsb45(

    input [1:0]A,
    input [1:0]B,
    output [1:0]S,
    output  CIN1
    );
    
 
  assign S[0] = ~(A[0]&B[0]);
  assign S[1] = ~(A[1]&B[1]);
  assign CIN1 = ((A[0]&A[1])|(B[0]&B[1]));

endmodule

