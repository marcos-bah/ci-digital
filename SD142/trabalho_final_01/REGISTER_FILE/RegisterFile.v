module RegisterFile(
    input wire clk,
    input wire reset,       // sinal de reset adicionado
    input wire WE3,
    input wire [4:0] RA1, RA2, WA3,
    input wire [31:0] WD3,
    output wire [31:0] RD1, RD2
);

    reg [31:0] REG_MEM_BLOCK[31:0];

    integer i;
    always @(posedge clk) begin
        if (reset) begin
            // Zera todos os registradores na borda de subida do clock se reset = 1
            for (i = 0; i < 32; i = i + 1)
                REG_MEM_BLOCK[i] <= 32'b0;

        end else if (WE3 && WA3 != 0) begin
            // Escreve apenas se WE3 ativo e não for registrador x0
            REG_MEM_BLOCK[WA3] <= WD3;
        end
    end

    initial begin
        REG_MEM_BLOCK[5] = 32'd6;
        REG_MEM_BLOCK[9] = 32'h1000;
    end

    // Leitura assíncrona
    assign RD1 = (RA1 != 0) ? REG_MEM_BLOCK[RA1] : 32'b0;
    assign RD2 = (RA2 != 0) ? REG_MEM_BLOCK[RA2] : 32'b0;

endmodule
