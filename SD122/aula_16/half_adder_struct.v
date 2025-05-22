// Módulo Half Adder (Meio Somador) - Descrição Estrutural
module half_adder_struct (
    input A,        // Primeiro bit de entrada
    input B,        // Segundo bit de entrada
    output Sum,     // Saída de soma (A ⊕ B)
    output Carry    // Saída de transporte (A · B)
);

    //nome_da_porta (saída, entrada1, entrada2);
    // Porta XOR para calcular a soma (Sum = A ⊕ B)
    xor (Sum, A, B);

    // Porta AND para calcular o transporte (Carry = A · B)
    and (Carry, A, B);

endmodule
