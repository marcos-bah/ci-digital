module register_file_tb;

reg clk, wr_en;
reg [1:0] wr_addr, rd_addr1, rd_addr2;
reg [7:0] wr_data;
wire [7:0] rd_data1, rd_data2;
wire wr_ack;

register_file #(
    .DATA_WIDTH(8),
    .ADDR_WIDTH(2),
    .REG_COUNT(4)
) uut (
    .clk(clk),
    .wr_en(wr_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .rd_addr1(rd_addr1),
    .rd_addr2(rd_addr2),
    .rd_data1(rd_data1),
    .rd_data2(rd_data2),
    .wr_ack(wr_ack)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $display("\nTestbench Register File");

    wr_en = 0;
    wr_addr = 0;
    wr_data = 0;
    rd_addr1 = 0;
    rd_addr2 = 0;

    // Escrever 8'hAA nos 4 registros
    wr_data = 8'hAA;
    wr_en = 1;
    wr_addr = 0;
    #10;
    wr_addr = 1;
    #10;
    wr_addr = 2;
    #10;
    wr_addr = 3;
    #10;
    wr_en = 0;

    // Ler registro[0] na porta 1, registro[1] na porta 2
    rd_addr1 = 0; rd_addr2 = 1;
    #10;

    // Ler registro[2] na porta 1, registro[3] na porta 2
    rd_addr1 = 2; rd_addr2 = 3;
    #10;

    // Escrever 8'h55 no registro 0
    wr_en = 1;
    wr_addr = 0;
    wr_data = 8'h55;
    #10;
    wr_en = 0;

    // Ler registro[0] nas duas portas
    rd_addr1 = 0; rd_addr2 = 0;
    #10;

    // Escrever 8'hFF no registro 1
    wr_en = 1;
    wr_addr = 1;
    wr_data = 8'hFF;
    #10;
    wr_en = 0;

    // Ler registro[1] nas duas portas
    rd_addr1 = 1; rd_addr2 = 1;
    #10;

    // Escrever 8'h22 no registro 2
    wr_en = 1;
    wr_addr = 2;
    wr_data = 8'h22;
    #10;
    wr_en = 0;

    // Ler registro[2] nas duas portas
    rd_addr1 = 2; rd_addr2 = 2;
    #10;

    // Escrever 8'hBF no registro 3
    wr_en = 1;
    wr_addr = 3;
    wr_data = 8'hBF;
    #10;
    wr_en = 0;

    // Ler registro[3] nas duas portas
    rd_addr1 = 3; rd_addr2 = 3;
    #10;

    $finish;
end

endmodule
