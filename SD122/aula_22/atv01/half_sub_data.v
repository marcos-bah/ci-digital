module half_sub_data(
    input A,      // Minuendo
    input B,      // Subtraendo
    output D,     // Diferença (A - B)
    output Borrow // Empréstimo
);
    // Diferença é calculada como A XOR B
    assign D = A ^ B;
    // Empréstimo é calculado como NOT(A) AND B
    assign Borrow = ~A & B;
endmodule
