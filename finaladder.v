`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2024 02:21:04 AM
// Design Name: 
// Module Name: finaladder
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


module finaladder(
input [7:0] A,B,
output [7:0]sum,
output [8:0]sumc,

output coutf1
    );
    assign sumc[3:0]= sum[3:0];
     wire carry1, carry2;
 CLA_4bit msb(
 .i_add1(A[7:4]),  .i_add2(B[7:4]), .carryin(carry1),  .o_result(sum[7:4]), .coutf(coutf1), .o_result_f(sumc[8:4])  );
 lsb67 lsb1( .A(A[3:2]),  .B(B[3:2]),  .CIN1(carry2), .S(sum[3:2]),  .CIN2(carry1)
 ); 
 lsb45 lsb2(

    .A(A[1:0]),
    .B(B[1:0]),
    .S(sum[1:0]),
    .CIN1(carry2)
    );  
endmodule
