module half_sub_behave_alt(
    input A,      // Minuendo
    input B,      // Subtraendo
    output reg D, // Diferença (A - B)
    output reg Borrow // Empréstimo
);
    // Bloco always para descrever o comportamento do circuito
    always @(*) begin
        D = A - B; // Diferença direta
        // Lógica para determinar o empréstimo (Borrow)
        if (A < B)
            Borrow = 1;
        else
            Borrow = 0;
    end
endmodule
