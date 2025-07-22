module WallaceTreeFD (
    input [3:0] A, B,
    output [7:0] S
);
    wire [3:0] p0, p1, p2, p3;

    assign p0 = A & {4{B[0]}};
    assign p1 = A & {4{B[1]}};
    assign p2 = A & {4{B[2]}};
    assign p3 = A & {4{B[3]}};

    // Nível 01
    wire s11, c11;
    assign s11 = p0[1] ^ p1[0];
    assign c11 = p0[1] & p1[0];

    wire s12, c12;
    assign s12 = p0[2] ^ p1[1] ^ p2[0];
    assign c12 = (p0[2] & p1[1]) | (p0[2] & p2[0]) | (p1[1] & p2[0]);

    wire s13, c13;
    assign s13 = p0[3] ^ p1[2] ^ p2[1];
    assign c13 = (p0[3] & p1[2]) | (p0[3] & p2[1]) | (p1[2] & p2[1]);

    wire s14, c14;
    assign s14 = p1[3] ^ p2[2];
    assign c14 = p1[3] & p2[2];

    // Nível 02
    wire s22, c22;
    assign s22 = s12 ^ c11;
    assign c22 = s12 & c11;

    wire s23, c23;
    assign s23 = p3[0] ^ s13 ^ c12;
    assign c23 = (p3[0] & s13) | (p3[0] & c12) | (s13 & c12);

    wire s24, c24;
    assign s24 = p3[1] ^ s14 ^ c13;
    assign c24 = (p3[1] & s14) | (p3[1] & c13) | (s14 & c13);

    wire s25, c25;
    assign s25 = p2[3] ^ p3[2] ^ c14;
    assign c25 = (p2[3] & p3[2]) | (p2[3] & c14) | (p3[2] & c14);

    // Nível 03
    wire s33, c33;
    assign s33 = s23 ^ c22;
    assign c33 = s23 & c22;

    wire s34, c34;
    assign s34 = s24 ^ c23 ^ c33;
    assign c34 = (s24 & c23) | (s24 & c33) | (c23 & c33);

    wire s35, c35;
    assign s35 = s25 ^ c24 ^ c34;
    assign c35 = (s25 & c24) | (s25 & c34) | (c24 & c34);

    wire s36, c36;
    assign s36 = p3[3] ^ c25 ^ c35;
    assign c36 = (p3[3] & c25) | (p3[3] & c35) | (c25 & c35);

    assign S[0] = p0[0];
    assign S[1] = s11;
    assign S[2] = s22;
    assign S[3] = s33;
    assign S[4] = s34;
    assign S[5] = s35;
    assign S[6] = s36;
    assign S[7] = c36;
endmodule
