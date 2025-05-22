module ativ4 (
    input [3:0] IN, // Entradas de 4 bits
    output Y // Saída do circuito
);

    wire A, B, C, D;

    assign {A, B, C, D} = IN;
    assign Y = D || C || (A && ~B);
    
endmodule