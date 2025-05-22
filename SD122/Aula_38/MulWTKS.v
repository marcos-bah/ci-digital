module MulWTKS (
    input [3:0] A, B,
    output [7:0] S
);
    wire s11,s22, s33, s34, s35, s36;
    wire c11, c12, c13, c14, c22, c23, c24, c25, c33, c34, c35, c36;
    wire [6:0] p0, p1, p2, p3;

    assign p0 = A & {4{B[0]}};
    assign p1 = A & {4{B[1]}};
    assign p2 = A & {4{B[2]}};
    assign p3 = A & {4{B[3]}};

    assign S[0] = p0[0];
    assign S[1] = s11;
    assign S[2] = s22;
    assign S[3] = s33;
    assign S[4] = s34;
    assign S[5] = s35;
    assign S[6] = s36;
    assign S[7] = c36;

    // Nivel: 01
    HA ha11 (p0[1], p1[0], s11, c11);
    FA #(1) fa12 (p0[2], p1[1], p2[0], s12, c12);
    FA #(1) fa13 (p0[3], p1[2], p2[1], s13, c13);
    HA ha14 (p1[3], p2[2], s14, c14);

    // Nivel: 02
    HA ha22 (s12, c11, s22, c22);
    FA #(1) fa23 (p3[0], s13, c12, s23, c23);
    FA #(1) fa24 (p3[1], s14, c13, s24, c24);
    FA #(1) fa25 (p2[3], p3[2], c14, s25, c25);

    // Nivel: 03
    KoggeStone ks ({c25, c24, c23, c22}, {p3[3], s25, s24, s23}, 1'b0, {s36, s35, s34, s33}, c36);
endmodule