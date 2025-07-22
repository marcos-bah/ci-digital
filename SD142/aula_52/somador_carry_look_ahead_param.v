//! Somador de 4-bits com carry look-ahead
module somador_carry_look_ahead_param #(parameter N = 8) (
    input  [N-1:0] A,     //! Entrada A (4 bits)
    input  [N-1:0] B,     //! Entrada B (4 bits)
    input        C_in,  //! Carry inicial
    output reg [N-1:0] S,     //! Soma final (4 bits)
    output reg       C_out  //! Carry final
);

    // Sinais intermediários para Carry-Generate (G) e Carry-Propagate (P)
    reg [N-1:0] G;  //! Carry-Generate
    reg [N-1:0] P;  //! Carry-Propagate
    reg [N:0] C;  //! Carry intermediário (C[0] = C_in, C[4] = C_out)

    integer i;

    always @(*) begin
        C[0] = C_in;

        // Calcular G e P
        G = A & B;   // G_i = A_i AND B_i
        P = A | B;   // P_i = A_i OR B_i

        for (i = 0; i < N; i = i + 1) begin
            C[i+1] = G[i] | (P[i] & C[i]);
        end

        S = A ^ B ^ C[N-1:0];  // S_i = A_i XOR B_i XOR C_i

        // Associar o Carry final
        C_out = C[N];
    end
endmodule
