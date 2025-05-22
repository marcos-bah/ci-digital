module half_sub_struct(
    input A,      // Minuendo
    input B,      // Subtraendo
    output D,     // Diferença (A - B)
    output Borrow // Empréstimo
);
    // Declaração de fios internos
    wire not_A; // ~A
    wire A_xor_B; // A XOR B
    // Porta NOT
    not u1(not_A, A);
    // Porta XOR para diferença
    xor u2(D, A, B);
    // Porta AND para empréstimo
    and u3(Borrow, not_A, B);
endmodule
