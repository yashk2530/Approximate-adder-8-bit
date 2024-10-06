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