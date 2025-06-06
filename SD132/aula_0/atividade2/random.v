module random (
    input clk, rst,
    output [3:0] s
);

    wire n1, n2;

    ffdr D (s[3], n1, clk, rst);
    ffjk C (clk, rst, s[3], 1'b1, s[2]);
    fft B (s[2], clk, rst, s[1]);
    ffdr A (s[0], n2, clk, rst);

    inversor inv (n1, s[2]);
    portanou pnou (n2, s[2], s[3]);
endmodule