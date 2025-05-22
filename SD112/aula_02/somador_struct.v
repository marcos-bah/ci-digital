module somador_struct (
    input A,        // Primeiro bit
    input B,        // Segundo bit
    input Cin,      // Carry in (entrada de transporte)
    output S,       // Soma
    output Cout     // Carry out (transporte de saída)
);
wire xor_ab, and_ab, and_cin_ab;  // Definição de sinais internos
//Instanciando as portas lógicas primitivas
xor i1 (xor_ab, A, B); 
and i2 (and_ab, A, B);
and i3 (and_cin_ab, Cin, xor_ab);
xor i4 (S, xor_ab, Cin);
or i5 (Cout, and_ab, and_cin_ab);
endmodule
