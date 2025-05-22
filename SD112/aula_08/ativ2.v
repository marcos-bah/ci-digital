module ativ2 (
    input [1:0] A, B, // Entradas de 2 bits cada
    output signed [2:0] Y1 // Saída de 4 bits
);

    assign Y1 = A - B;
    
endmodule