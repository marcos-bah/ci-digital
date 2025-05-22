module ativ1 (
    input [1:0] A, B, // Entradas de 2 bits cada
    output [3:0] Y1 // Saída de 4 bits
);

    assign Y1 = {A, B};
    
endmodule