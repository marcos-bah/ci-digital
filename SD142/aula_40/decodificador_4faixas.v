module decodificador_4faixas (
    input clk,
    input [15:0] addr,
    output reg [3:0] cs
);

    always @(*) begin
        case (addr[15:10])
            6'h01: cs = 4'b0001; // 16'h0400 - 16'h07FF (1 KB)
            6'h02: cs = 4'b0010; // 16'h0800 - 16'h0BFF (1 KB)
            6'h03: cs = 4'b0100; // 16'h0C00 - 16'h0FFF (1 KB)
            6'h1F: cs = 4'b1000; // 16'h7C00 - 16'h7FFF (1 KB)
            default: cs = 4'b0000;
        endcase
    end

endmodule
