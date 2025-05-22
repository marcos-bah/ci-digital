module struct_4bit_carry_look_ahead_adder (
    input [3:0] A,           //! Entradas de 4 bits
    input [3:0] B,           //! Entradas de 4 bits
    input Cin,               //! Carry de entrada
    output [3:0] Sum,        //! Soma de 4 bits
    output Cout              //! Carry de saída
);
    wire [3:0] P;            //! Propagação
    wire [3:0] G;            //! Geração
    wire [3:1] C;            //! Carries intermediários

    // Geradores de Propagação (P = A XOR B)
    xor (P[0], A[0], B[0]);
    xor (P[1], A[1], B[1]);
    xor (P[2], A[2], B[2]);
    xor (P[3], A[3], B[3]);

    // Geradores de Geração (G = A AND B)
    and (G[0], A[0], B[0]);
    and (G[1], A[1], B[1]);
    and (G[2], A[2], B[2]);
    and (G[3], A[3], B[3]);

    // Lógica de Carry Look-Ahead
    wire t1, t2, t3; //! Sinais intermediários

    // C[1] = G[0] + (P[0] & Cin)
    and (t1, P[0], Cin);
    or  (C[1], G[0], t1);

    // C[2] = G[1] + (P[1] & G[0]) + (P[1] & P[0] & Cin)
    and (t2, P[1], G[0]);
    and (t3, P[1], P[0], Cin);
    or  (C[2], G[1], t2, t3);

    // C[3] = G[2] + (P[2] & G[1]) + (P[2] & P[1] & G[0]) + (P[2] & P[1] & P[0] & Cin)
    wire t4, t5, t6; //! Sinais intermediários
    and (t4, P[2], G[1]);
    and (t5, P[2], P[1], G[0]);
    and (t6, P[2], P[1], P[0], Cin);
    or  (C[3], G[2], t4, t5, t6);

    // Carry de saída
    wire t7, t8, t9, t10; //! Sinais intermediários
    and (t7, P[3], G[2]);
    and (t8, P[3], P[2], G[1]);
    and (t9, P[3], P[2], P[1], G[0]);
    and (t10, P[3], P[2], P[1], P[0], Cin);
    or  (Cout, G[3], t7, t8, t9, t10);

    // Soma final (Sum = P XOR C)
    xor (Sum[0], P[0], Cin);
    xor (Sum[1], P[1], C[1]);
    xor (Sum[2], P[2], C[2]);
    xor (Sum[3], P[3], C[3]);

endmodule
