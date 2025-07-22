module register_file_8x16_tb;

    reg clk;
    reg wr_en;
    reg [2:0] wr_addr, rd_addr1, rd_addr2;
    reg [15:0] wr_data;
    wire [15:0] rd_data1, rd_data2;

    register_file_8x16 uut (
        .clk(clk),
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .rd_addr1(rd_addr1),
        .rd_addr2(rd_addr2),
        .wr_data(wr_data),
        .rd_data1(rd_data1),
        .rd_data2(rd_data2)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("\n Register File 16bits");

        wr_en = 0;
        wr_addr = 3'b000;
        rd_addr1 = 3'b000;
        rd_addr2 = 3'b000;
        wr_data = 16'hAAAA;

        // Tentativa de escrita no registrador 0 (não deve funcionar!!!!)
        #10;
        wr_en = 1;
        wr_addr = 3'b000;
        wr_data = 16'hDEAD;
        #10;
        wr_en = 0;

        // Leitura do registrador 0 (deve ser 0)
        rd_addr1 = 3'b000;
        #1 $display("Leitura do registro 0 (esperado 0x0000): rd_data1 = %h", rd_data1);

        // Escrita no registrador 3
        #10;
        wr_en = 1;
        wr_addr = 3'b011;
        wr_data = 16'hBEEF;
        #10;
        wr_en = 0;

        // Leitura do registrador 3
        rd_addr1 = 3'b011;
        #1 $display("Leitura do registro 3 (esperado 0xBEEF): rd_data1 = %h", rd_data1);

        // Fim do teste
        #10;
        $finish;
    end

endmodule
