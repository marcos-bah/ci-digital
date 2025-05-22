module tabela_verdade_4_variaveis (
    input A,
    input B,
    input C,
    input D,
    output S_mintermos,
    output S_maxtermos
);
assign S_mintermos = (A & ~B & C & D);
assign S_maxtermos = (A | B | C | D) & (A | B | C | ~D) & (A | B | ~C | D) & (A | B | ~C | ~D) & 
                     (A | ~B | C | D) & (A | ~B | C | ~D) & (A | ~B | ~C | D) & (A | ~B | ~C | ~D) & 
                     (~A | B | C | D) & (~A | B | C | ~D) & (~A | B | ~C | D) & 
                     (~A | ~B | C | D) & (~A | ~B | C | ~D) & (~A | ~B | ~C | D) & (~A | ~B | ~C | ~D);
                     
endmodule
