module full_sub_data(
    input A, B, BorrowIn,
    output D, BorrowOut
);
    // Diferença (D) e BorrowOut calculados usando expressões lógicas
    assign D = A ^ B ^ BorrowIn;  // XOR para a diferença
    assign BorrowOut = (~A & B) | ((~A | B) & BorrowIn); // Lógica do BorrowOut
endmodule
