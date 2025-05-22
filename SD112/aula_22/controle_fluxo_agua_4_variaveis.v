module controle_fluxo_agua_4_variaveis (
    input A,
    input B,
    input C,
    input D,
    output S_mintermos,
    output S_maxtermos,
    output S_karnaugh
);

assign S_mintermos = (A & ~B & C & D);
assign S_maxtermos = (A | B | C | D) & (A | B | C | ~D) & (A | B | ~C | D) & (A | B | ~C | ~D) &
                    (A | ~B | C | D) & (A | ~B | C | ~D) & (A | ~B | ~C | D) & (A | ~B | ~C | ~D) &
                    (~A | B | C | D) & (~A | B | C | ~D) & (~A | B | ~C | D) &
                    (~A | ~B | C | D) & (~A | ~B | C | ~D) & (~A | ~B | ~C | D) & (~A | ~B | ~C | ~D);

assign S_karnaugh = (A & ~B & C & D);
endmodule

