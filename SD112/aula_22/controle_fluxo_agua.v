module controle_fluxo_agua (
    input A,
    input B,
    input C,
    output S_mintermos,
    output S_maxtermos,
    output S_karnaugh
);

// Saida S utilizando mintermos
assign S_mintermos = (A & B & ~C) | (A & B & C);

// Saida S utilizando maxtermos
assign S_maxtermos = (A | B | C) & (A | B | ~C) & (A | ~B | C) & (A | ~B | ~C) & (~A | B | C) & (~A | B | ~C);

assign S_karnaugh = (A & B);

endmodule
