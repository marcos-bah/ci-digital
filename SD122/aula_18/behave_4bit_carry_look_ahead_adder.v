module behave_4bit_carry_lookahead_adder (
    input [3:0] A,   //! Operando A (4 bits)
    input [3:0] B,   //! Operando B (4 bits)
    input Cin,       //! Carry de entrada
    output reg [3:0] Sum, //! Resultado da soma (4 bits)
    output reg Cout       //! Carry de saída
);

    // Registradores internos para propagação e geração
    reg [3:0] P;    //! Propagação
    reg [3:0] G;    //! Geração
    reg [3:0] C;    //! Carries internos

    // Bloco procedural que calcula a soma
    always @(*) begin
        // Lógica de propagação e geração
        P = A ^ B;       // Propagação: P[i] = A[i] XOR B[i]
        G = A & B;       // Geração: G[i] = A[i] AND B[i]

        // Lógica de Carry Look-Ahead
        C[0] = Cin;                              // O primeiro carry vem do carry de entrada
        C[1] = G[0] | (P[0] & C[0]);             // Carry para o bit 1
        C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]); // Carry para o bit 2
        C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]); // Carry para o bit 3

        // Carry de saída
        Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |
               (P[3] & P[2] & P[1] & P[0] & C[0]);

        // Soma final
        Sum = P ^ C;
    end

endmodule
