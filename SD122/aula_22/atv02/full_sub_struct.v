module full_sub_strutct(
    input A, B, BorrowIn,
    output D, BorrowOut
);
    wire w1, w2, w3, w4;
    // Diferença: D = A ^ B ^ BorrowIn
    xor (w1, A, B);
    xor (D, w1, BorrowIn);
    // BorrowOut = (~A & B) | ((~A | B) & BorrowIn)
    not (w2, A);          // ~A
    and (w3, w2, B);      // ~A & B
    or  (w4, w2, B);      // ~A | B
    and (w5, w4, BorrowIn); // (~A | B) & BorrowIn
    or  (BorrowOut, w3, w5); // (~A & B) | ((~A | B) & BorrowIn)
endmodule
