module ffsr (
    input  clk,
    input  rst,
    input  S,
    input  R,
    output reg Q,
    output Qn
);

assign Qn = ~Q;

always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 0; // Reset assíncrono
    else begin
        case ({S, R})
            2'b00: Q <= Q;     // Sem alteração
            2'b01: Q <= 0;     // Reset
            2'b10: Q <= 1;     // Set
            2'b11: Q <= 1'bx;  // Estado inválido
        endcase
    end
end

endmodule