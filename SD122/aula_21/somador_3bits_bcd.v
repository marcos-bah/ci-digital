module somador_3bits_bcd (
    input [11:0] A, B,
    input Cin,
    output [11:0] Y,
    output Cout
);
    wire c_out0, c_out1; 
    somador_bcd i1 (Cin, A[3:0], B[3:0], Y[3:0], c_out0);
    somador_bcd i2 (c_out0, A[7:4], B[7:4], Y[7:4], c_out1);
    somador_bcd i3 (c_out1, A[11:8], B[11:8], Y[11:8], Cout);
endmodule