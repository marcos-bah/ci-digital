module full_sub_struct_alt (
    input A, B, BorrowIn,
    output D, BorrowOut
);
    // Sinais intermediários
    wire D1, Borrow1, Borrow2;
    // Instância do primeiro meio subtrator
    meio_subtrator ms1 (
        .A(A),
        .B(B),
        .D(D1),
        .BorrowOut(Borrow1)
    );
    // Instância do segundo meio subtrator
    meio_subtrator ms2 (
        .A(D1),
        .B(BorrowIn),
        .D(D),
        .BorrowOut(Borrow2)
    );
    // Porta lógica OR para calcular o Borrow Out final
    assign BorrowOut = Borrow1 | Borrow2;
endmodule

module meio_subtrator (
    input A, B,
    output D, BorrowOut
);
    assign D = A ^ B;             // Diferença (XOR)
    assign BorrowOut = ~A & B;    // Borrow (AND com NOT)
endmodule
