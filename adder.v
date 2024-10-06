`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2024 08:34:47 PM
// Design Name: 
// Module Name: adder
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


module adder(
input [7:0]a,
input [7:0]b,
input clk,
output reg [8:0]sum
    );
    
    always@(posedge clk) begin 
    
     sum = a+b;
    end
    
      
endmodule

module adder(
input [7:0] A,B,
input clk,
output [7:0]sum,
output  [8:0]sumc,

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




module CLA_4bit(

    input [3:0]  i_add1,
   input [3:0]  i_add2,
   input carryin,
    output [3:0] o_result,
    output coutf,
    output [4:0] o_result_f
    

   );
     
  wire [4:0]    w_C;
  wire [3:0]    w_G, w_P, w_SUM;
   
  full_adder full_adder_bit_0
    ( 
      .i_bit1(i_add1[0]),
      .i_bit2(i_add2[0]),
      .i_carry(w_C[0]),
      .o_sum(w_SUM[0]),
      .o_carry()
      );
 
  full_adder full_adder_bit_1
    ( 
      .i_bit1(i_add1[1]),
      .i_bit2(i_add2[1]),
      .i_carry(w_C[1]),
      .o_sum(w_SUM[1]),
      .o_carry()
      );
 
  full_adder full_adder_bit_2
    ( 
      .i_bit1(i_add1[2]),
      .i_bit2(i_add2[2]),
      .i_carry(w_C[2]),
      .o_sum(w_SUM[2]),
      .o_carry()
      );
   
  full_adder full_adder_bit_3
    ( 
      .i_bit1(i_add1[3]),
      .i_bit2(i_add2[3]),
      .i_carry(w_C[3]),
      .o_sum(w_SUM[3]),
      .o_carry()
      );
   
  // Create the Generate (G) Terms:  Gi=Ai*Bi
  assign w_G[0] = i_add1[0] & i_add2[0];
  assign w_G[1] = i_add1[1] & i_add2[1];
  assign w_G[2] = i_add1[2] & i_add2[2];
  assign w_G[3] = i_add1[3] & i_add2[3];
 
  // Create the Propagate Terms: Pi=Ai+Bi
  assign w_P[0] = i_add1[0] | i_add2[0];
  assign w_P[1] = i_add1[1] | i_add2[1];
  assign w_P[2] = i_add1[2] | i_add2[2];
  assign w_P[3] = i_add1[3] | i_add2[3];
 
  // Create the Carry Terms:
  assign w_C[0] = carryin; // no carry input
  assign w_C[1] = w_G[0] | (w_P[0] & w_C[0]);
  assign w_C[2] = w_G[1] | (w_P[1] & w_C[1]);
  assign w_C[3] = w_G[2] | (w_P[2] & w_C[2]);
  assign w_C[4] = w_G[3] | (w_P[3] & w_C[3]);
   
  
 assign o_result[3:0] =  w_SUM[3:0];
 assign o_result_f = {w_C[4], w_SUM};   // Verilog Concatenation
 assign coutf = w_C[4];
 
endmodule // carry_lookahead_adder_4_bit


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



module lsb67(
    input [1:0] A,
    input [1:0] B,
    input CIN1,
    output [1:0] S,
    output CIN2
    );
    
    wire CIN_wire;

    
    assign S[0] = (CIN1 == 0) ? ~(A[0] & B[0]) : (A[0] & B[0]);
    assign S[1] = (CIN1 == 0) ? ~(A[1] & B[1]) : (A[1] & B[1]);

    assign CIN_wire = (CIN1 == 0) ? ((A[0] & A[1]) | (B[0] & B[1])) : ((A[0] & A[1]) | (B[0] & B[1]));

    assign CIN2 = CIN_wire | CIN1;

endmodule


module full_adder 
  (
   i_bit1,
   i_bit2,
   i_carry,
   o_sum,
   o_carry
   );
 
  input  i_bit1;
  input  i_bit2;
  input  i_carry;
  output o_sum;
  output o_carry;
 
  wire   w_WIRE_1;
  wire   w_WIRE_2;
  wire   w_WIRE_3;
       
  assign w_WIRE_1 = i_bit1 ^ i_bit2;
  assign w_WIRE_2 = w_WIRE_1 & i_carry;
  assign w_WIRE_3 = i_bit1 & i_bit2;
 
  assign o_sum   = w_WIRE_1 ^ i_carry;
  assign o_carry = w_WIRE_2 | w_WIRE_3;
 

endmodule 
