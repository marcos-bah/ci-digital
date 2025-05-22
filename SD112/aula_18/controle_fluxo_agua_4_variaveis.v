module controle_fluxo_agua_4_variaveis (
    input A, B, C, D,
    output S_mintermos, S_maxtermos
);

// Saida S utilizando mintermos
assign S_mintermos = (A & B & ~C & D) | (A & B & C & ~D) | (A & B & C & D);

// Saida S utilizando maxtermos
assign S_maxtermos = (A | B | C | D) & (A | B | C | ~D) & (A | B | ~C | D) & (A | B | ~C | ~D) & (A | ~B | C | D) & (A | ~B | C | ~D) & (A | ~B | ~C | D) & (A | ~B | ~C | ~D) & (~A | B | C | D) & (~A | B | C | ~D) & (~A | B | ~C | D) & (~A | B | ~C | ~D) & (~A | ~B | C | D);

endmodule
