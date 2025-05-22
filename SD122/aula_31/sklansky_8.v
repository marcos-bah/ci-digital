module sklansky_8 (
    input  [7:0] A, B,
    input        Cin,
    output [7:0] Sum,
    output       Cout
);
    wire [7:0] G0, P0;
    wire g0_cin_a, g0_cin_b, g0_ab;

    // Inserção do Cin na geração inicial
    assign g0_cin_a = A[0] & Cin;
    assign g0_cin_b = B[0] & Cin;
    assign g0_ab    = A[0] & B[0];
    assign G0[0]    = g0_cin_a | g0_cin_b | g0_ab;
    assign G0[7:1]  = A[7:1] & B[7:1];
    assign P0       = A ^ B;

    // Nível 1
    wire g1_1, g1_3, g1_5, g1_7;
    wire p1_3, p1_5, p1_7;

    assign g1_1 = G0[1] | (P0[1] & G0[0]);
    assign g1_3 = G0[3] | (P0[3] & G0[2]);
    assign g1_5 = G0[5] | (P0[5] & G0[4]);
    assign g1_7 = G0[7] | (P0[7] & G0[6]);

    assign p1_3 = P0[3] & P0[2];
    assign p1_5 = P0[5] & P0[4];
    assign p1_7 = P0[7] & P0[6];

    // Nível 2
    wire g2_2, g2_3, g2_6, g2_7;
    wire p2_6, p2_7;

    assign g2_2 = G0[2] | (P0[2] & g1_1);
    assign g2_3 = g1_3 | (p1_3 & g1_1);
    assign g2_6 = G0[6] | (P0[6] & g1_5);
    assign g2_7 = g1_7 | (p1_7 & g1_5);

    assign p2_6 = P0[6] & p1_5;
    assign p2_7 = p1_7 & p1_5;

    // Nível 3
    wire g3_4, g3_5, g3_6, g3_7;

    assign g3_4 = G0[4] | (P0[4] & g2_3);
    assign g3_5 = g1_5 | (p1_5 & g2_3);
    assign g3_6 = g2_6 | (p2_6 & g2_3);
    assign g3_7 = g2_7 | (p2_7 & g2_3);

    // Carries
    wire [8:0] carry;
    assign carry[0] = Cin;
    assign carry[1] = G0[0];
    assign carry[2] = g1_1;
    assign carry[3] = g2_2;
    assign carry[4] = g2_3;
    assign carry[5] = g3_4;
    assign carry[6] = g3_5;
    assign carry[7] = g3_6;
    assign carry[8] = g3_7;

    assign Sum  = P0 ^ carry[7:0];
    assign Cout = carry[8];

endmodule
