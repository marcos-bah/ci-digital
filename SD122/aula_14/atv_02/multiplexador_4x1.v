module multiplexador_4x1 (
    input wire S1, S0, // Entradas de seleção (B, C)
    input wire I0, I1, I2, I3, // Entradas de dados
    output wire Y // Saída do multiplexador
);
    assign Y = (~S1 & ~S0 & I0) | // Seleção para I0
                (~S1 & S0 & I1) | // Seleção para I1
                (S1 & ~S0 & I2) | // Seleção para I2
                (S1 & S0 & I3); // Seleção para I3
endmodule