module full_sub_behave_alt(
    input A, B, BorrowIn,
    output reg D, BorrowOut
);
    always @(*) begin
        // Diferença calculada diretamente
        {BorrowOut, D} = A - B - BorrowIn; 
    end
endmodule
