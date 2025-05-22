module somador_data (
    input A,        // Entrada A
    input B,        // Entrada B
    input Cin,      // Carry de entrada
    output S,       // Soma
    output Cout     // Carry de saída
);

    // Fluxo de dados para a soma e carry de saída
    assign S = A ^ B ^ Cin;       // Soma é a XOR de A, B e Cin
    assign Cout = (A & B) | (Cin & (A^B)); // Carry de saída é a combinação dos carries de A, B e Cin

endmodule
