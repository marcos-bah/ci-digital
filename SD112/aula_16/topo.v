module topo (
    input [2:0] X, Y, Z,
    input SEL,
    output [2:0] s_n1, s_n2, S
);
    wire [2:0] n1, n2;
    
    somador i0(.A(X), .B(Y), .soma(n1), .cin(1'b0));
    mux2x1 i1(.S(SEL), .D0(n1), .D1(Z), .Y(n2));

    codificador i2(.bin(n2), .gray(S));

    assign s_n1 = n1;
    assign s_n2 = n2;

endmodule