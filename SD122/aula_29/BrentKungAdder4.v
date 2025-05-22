module BrentKungAdder4 (
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [3:0] P, G; // Propagacao e Geracao individual
    wire [3:0] C; // Carries intermediarios (C[0] eh carry -in)

    assign P = A ^ B;
    assign G = A & B;

    // Etapa 1: Reducao ( upward phase )
    wire G1_0 , P1_0;
    assign G1_0 = G [1] | (P [1] & G [0]);
    assign P1_0 = P [1] & P [0];

    wire G3_2 , P3_2;
    assign G3_2 = G [3] | (P [3] & G [2]);
    assign P3_2 = P [3] & P [2];

    // wire G2_0 , P2_0;
    // assign G2_0 = G [2] | (P [2] & G1_0 );
    // assign P2_0 = P [2] & P1_0;

    wire G3_1 , P3_1;
    assign G3_1 = G3_2 | ( P3_2 & G1_0 );
    assign P3_1 = P3_2 & P1_0;

    // Etapa 2: Distribuicao ( downward phase )
    assign C [0] = Cin;
    assign C [1] = G [0] | (P [0] & C [0]);
    assign C [2] = G1_0 | ( P1_0 & C [0]);
    assign C [3] = G3_1 | ( P3_1 & C [0]);

    // Etapa 3: Soma
    assign Sum = P ^ C;
    assign Cout = G3_1 | ( P3_1 & C [0]);

endmodule