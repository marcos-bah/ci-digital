module somador_3b (
    input [2:0] A,
    input [2:0] B,
    input Cin,
    output [2:0] S,
    output Cout
);

    wire w_c1, w_c2;

    somador_struct i0 (A[0], B[0], Cin, S[0], w_c1);
    somador_data i1 (.A(A[1]), .B(B[1]), .Cin(w_c1), .S(S[1]), .Cout(w_c2));
    somador_behave i2 (.A(A[2]), .B(B[2]), .Cin(w_c2), .S(S[2]), .Cout(Cout));
    
endmodule