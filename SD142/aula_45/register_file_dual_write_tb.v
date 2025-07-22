module register_file_dual_write_tb;

    reg clk;
    reg rst;
    reg we1, we2;
    reg [2:0] write_addr1, write_addr2;
    reg [15:0] write_data1, write_data2;
    reg [2:0] read_addr1, read_addr2;

    wire [15:0] read_data1, read_data2;

    register_file_dual_write uut (
        .clk(clk),
        .rst(rst),
        .we1(we1),
        .write_addr1(write_addr1),
        .write_data1(write_data1),
        .we2(we2),
        .write_addr2(write_addr2),
        .write_data2(write_data2),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        we1 = 0; we2 = 0;
        write_addr1 = 0; write_addr2 = 0;
        write_data1 = 0; write_data2 = 0;
        read_addr1 = 0; read_addr2 = 0;

        #10 rst = 0;

        // Teste 1: Escrita com apenas uma porta (porta 1)
        #10;
        we1 = 1;
        write_addr1 = 3'd1;
        write_data1 = 16'hAAAA;
        we2 = 0;

        #10;
        we1 = 0;
        read_addr1 = 3'd1;

        #10;
        $display("Teste 1: read_data1 = %h (esperado: AAAA)", read_data1);

        // Teste 2: Escrita simultânea com endereços diferentes
        #10;
        we1 = 1; we2 = 1;
        write_addr1 = 3'd2;
        write_data1 = 16'h1111;
        write_addr2 = 3'd3;
        write_data2 = 16'h2222;

        #10;
        we1 = 0; we2 = 0;
        read_addr1 = 3'd2;
        read_addr2 = 3'd3;

        #10;
        $display("Teste 2: read_data1 = %h (esperado: 1111), read_data2 = %h (esperado: 2222)", read_data1, read_data2);

        // Teste 3: Conflito - escrita simultânea no mesmo registrador (porta 2 tem prioridade)
        #10;
        we1 = 1; we2 = 1;
        write_addr1 = 3'd4;
        write_data1 = 16'hAAAA;
        write_addr2 = 3'd4;
        write_data2 = 16'hBBBB;

        #10;
        we1 = 0; we2 = 0;
        read_addr1 = 3'd4;

        #10;
        $display("Teste 3: read_data1 = %h (esperado: BBBB)", read_data1);

        #10;
        $finish;
    end

endmodule
