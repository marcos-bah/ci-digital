module full_sub_behave(
    input A, B, BorrowIn,
    output reg D, BorrowOut
);
    always @(*) begin
        // Diferença calculada manualmente
        D = A ^ B ^ BorrowIn; 
        // BorrowOut usando as condições
        if (~A & B)
            BorrowOut = 1;
        else if ((~A | B) & BorrowIn)
            BorrowOut = 1;
        else
            BorrowOut = 0;
    end
endmodule
