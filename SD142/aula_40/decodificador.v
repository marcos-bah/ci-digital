module decodificador (
    input clk,
    input [15:0] addr,
    output reg cs
);

    always @(*) begin
        cs = (addr >= 16'h0400 && addr <= 16'h07FF);
    end

endmodule
