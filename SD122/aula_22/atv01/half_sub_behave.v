module half_sub_behave(
    input A,      // Minuendo
    input B,      // Subtraendo
    output reg D, // Diferença (A - B)
    output reg Borrow // Empréstimo
);
    // Bloco always para descrever o comportamento do circuito
    always @(*) begin
        D = A ^ B;            // Diferença: A XOR B
        Borrow = (~A) & B;    // Empréstimo: NOT(A) AND B
    end
endmodule
