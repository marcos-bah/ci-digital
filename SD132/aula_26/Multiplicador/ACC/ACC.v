module ACC #(parameter DATA_LENGTH = 4) (
    input Load, Sh, Ad, Clk, rst,
    input  [2*DATA_LENGTH:0] Entradas,
    output reg [2*DATA_LENGTH:0] Saidas
);

always @(posedge Clk, posedge rst) begin
    if (rst)
        Saidas <= 0;
    if (Load)
        Saidas <= {{(DATA_LENGTH){1'b0}}, Entradas[DATA_LENGTH-1:0]};
    if (Sh)
        Saidas <= Saidas >> 1;
    if (Ad)
        Saidas[2*DATA_LENGTH:DATA_LENGTH] <= Entradas[2*DATA_LENGTH:DATA_LENGTH];
end

endmodule
