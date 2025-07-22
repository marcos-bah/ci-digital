module register_file_8x16 (
    input wire clk,
    input wire wr_en,
    input wire [2:0] wr_addr,    // 3 bits = 8 registradores
    input wire [2:0] rd_addr1,
    input wire [2:0] rd_addr2,
    input wire [15:0] wr_data,
    output wire [15:0] rd_data1,
    output wire [15:0] rd_data2
);

    // Memória de registradores: 8 registradores de 16 bits
    reg [15:0] registers[7:0];

    // Escrita síncrona (exceto registrador 0)
    always @(posedge clk) begin
        if (wr_en && wr_addr != 3'b000) begin
            registers[wr_addr] <= wr_data;
        end
    end

    // Leitura assíncrona com proteção para registrador 0
    assign rd_data1 = (rd_addr1 == 3'b000) ? 16'b0 : registers[rd_addr1];
    assign rd_data2 = (rd_addr2 == 3'b000) ? 16'b0 : registers[rd_addr2];

endmodule
