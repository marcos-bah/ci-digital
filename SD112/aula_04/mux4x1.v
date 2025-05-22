module mux4x1 (
    input [1:0] S,
    input D0, D1,
    input D2, D3,
    output Y
);

    wire w_01, w_02;

    mux2x1 i0 (.S(S[0]),.D0(D0), .D1(D1), .Y(w_01));
    mux2x1 i1 (.S(S[0]),.D0(D2), .D1(D3), .Y(w_02));
    mux2x1 i2 (.S(S[1]),.D0(w_01), .D1(w_02), .Y(Y));
    
endmodule