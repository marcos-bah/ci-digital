module dataflow (
    input [3:0] IN, // Entradas de 4 bits
    output Y // Saída do circuito
);

    wire A, B, C, D;

    assign {A, B, C, D} = IN;

    assign Y = (~A && ~C && ~D) 
            || (~A && B && ~D) 
            || (~A && ~B && C && D) 
            || (A && B && C && D) 
            || (A && ~B && ~C && D) 
            || (A && ~B && C && ~D); 
    
endmodule