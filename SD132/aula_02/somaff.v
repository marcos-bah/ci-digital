module somaff (
    input [3:0] entrada,
    input hab1, hab2, clk, rst,
    output [3:0] s,
    output cout
);
    wire [3:0] n1, n2;
    ffdr_en ffdr1 (entrada, clk, rst, hab1, n1);
    ffdr_en ffdr2 (entrada, clk, rst, hab2, n2);

    somador4b somador1 (s, cout, n1, n2, 1'b0);
endmodule