module BrentKungAdder8 (
    input [7:0] A, B,
    input Cin,
    output [7:0] Sum,
    output Cout
);

    wire [7:0] G, P, C;

    assign P = A ^ B;
    assign G = A & B;

    // Reducao nivel 1
    wire G1_0 = G[1] | (P[1] & G[0]);
    wire P1_0 = P[1] & P[0];
    wire G3_2 = G[3] | (P[3] & G[2]);
    wire P3_2 = P[3] & P[2];
    wire G5_4 = G[5] | (P[5] & G[4]);
    wire P5_4 = P[5] & P[4];
    wire G7_6 = G[7] | (P[7] & G[6]);
    wire P7_6 = P[7] & P[6];

    // Reducao nivel 2
    wire G3_0 = G3_2 | (P3_2 & G1_0);
    wire P3_0 = P3_2 & P1_0;

    wire G7_4 = G7_6 | (P7_6 & G5_4);
    wire P7_4 = P7_6 & P5_4;

    // Redução Raiz
    wire G7_0 = G7_4 | (P7_4 & G3_0);
    wire P7_0 = P7_4 & P3_0;

    // Distribuicao
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]); // G[0:0]
    assign C[2] = G1_0 | (P1_0 & C[0]); // G[1:0]
    assign C[3] = G[2] | (P[2] & C[2]); // G[2] + P2·C2
    
    assign C[4] = G3_0 | (P3_0 & C[0]); // G[3:0]
    assign C[5] = G[4] | (P[4] & C[4]); // G[4] + P4·C4
    assign C[6] = G5_4 | (P5_4 & C[4]); // G[5:4]
    assign C[7] = G7_6 | (P7_6 & C[6]); // G[7:6]

    // Soma final
    assign Sum = P ^ C;
    assign Cout = G7_0 | (P7_0 & C[0]);
endmodule