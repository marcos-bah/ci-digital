module mux4x1_2 (
    input D0, D1, D2, D3,
    input [1:0] S,
    output reg Y
);
    always @ (D0, D1, D2, D3, S) begin
        case (S)
            2'b00: Y = D0; // Se S = 00, a saída é D0
            2'b01: Y = D1; // Se S = 01, a saída é D1
            2'b10: Y = D2; // Se S = 10, a saída é D2
            2'b11: Y = D3; // Se S = 11, a saída é D3
            default: Y = 1'b0; // Caso contrário , a saída será 0
        endcase
    end
endmodule