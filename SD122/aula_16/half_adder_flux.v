// Módulo Half Adder (Meio Somador)
module half_adder_flux (
    input A,        // Primeiro bit de entrada
    input B,        // Segundo bit de entrada
    output Sum,     // Saída de soma (A ⊕ B)
    output Carry    // Saída de transporte (A · B)
);

    // Descrição por fluxo de dados
    assign Sum = A ^ B;     // Soma é a operação XOR dos bits de entrada
    assign Carry = A & B;   // Transporte é a operação AND dos bits de entrada

endmodule
