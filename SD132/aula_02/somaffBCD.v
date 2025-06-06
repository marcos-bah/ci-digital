module somaffBCD (
    input [3:0] entrada,
    input clk, rst, EN1, EN2, EN3, EN4,
    output [7:0] saida
);
    wire [3:0] nqa, nqb, nqc, nqs, n1, soma1, cout, cout2;
    ffdr_en ffdr1 (entrada, clk, rst, EN1, nqa);
    ffdr_en ffdr2 (entrada, clk, rst, EN2, nqb);
    ffdr_en ffdr3 (entrada, clk, rst, EN3, nqc);
    somador4b somador1 (soma1, cout, nqa, nqb, 1'b0);
    somador4b somador2 (nqs, cout2, soma1, nqc, cout);
    ffdr_en ffdr4 (nqs, clk, rst, EN4, n1);
    conversorbcd conversor (n1, saida);
endmodule