module spi_tb;

    // Parâmetros
    localparam CLK_FREQ = 50000000;
    localparam SCLK_FREQ = 1000000;


    // Sinais
    reg clk;
    reg reset;
    reg [7:0] data_in;
    reg start;
    reg CPOL;
    reg CPHA;

    wire SCLK;
    wire [7:0] data_out;
    wire busy;

    // Instancia o módulo SPI
    spi #(
        .CLK_FREQ(CLK_FREQ),
        .SCLK_FREQ(SCLK_FREQ)
    ) uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .start(start),
        .CPOL(CPOL),
        .CPHA(CPHA),
        .SCLK(SCLK),
        .data_out(data_out),
        .busy(busy)
    );

    // Variáveis para teste
    reg [7:0] expected_data;
    integer total_tests = 0;
    integer passed_tests = 0;

    // Tarefa para realizar e verificar uma transação SPI
    task spi_test(input [7:0] tx_data);
        begin
            reset_values;

            wait (reset == 0);

            total_tests = total_tests + 1;
            data_in = tx_data;
            expected_data = tx_data;  // Para este teste, o escravo deve ecoar o valor

            start = 1;
            #20;
            start = 0;
            #20;

            // Aguarda transmissão
            wait (busy == 0);
            #40; // Espera estabilidade

            if (data_out === expected_data) begin
                $display("PASS Teste %0d PASSOU: Enviado = %b, Recebido = %b", total_tests, tx_data, data_out);
                passed_tests = passed_tests + 1;
            end else begin
                $display("FAIL Teste %0d FALHOU: Enviado = %b, Recebido = %b (Esperado = %b)", total_tests, tx_data, data_out, expected_data);
            end
        end
    endtask

    task reset_values;
        begin
            reset = 1;
            start = 0;
            data_in = 8'h00;
            #100;
            reset = 0;
            #100;
        end
    endtask

    initial begin
        CPOL = 0;
        CPHA = 0;
        clk = 0;
        reset = 0;
    end

    // Clock do sistema: 20ns período (50MHz)
    always #10 clk = ~clk;

    // Estímulos de teste
    initial begin
        $display("Iniciando Testbench SPI");

        // Reset
        reset_values;

        // Executa vários testes automáticos
        spi_test(8'b10101010);
        spi_test(8'b11110000);
        spi_test(8'b00001111);
        spi_test(8'b11001100);
        spi_test(8'b00000000);
        spi_test(8'b11111111);

        $display("\nTestes concluídos: %0d / %0d passaram.", passed_tests, total_tests);

        if (passed_tests == total_tests) begin
            $display("TODOS OS TESTES PASSARAM!");
        end else begin
            $display("ALGUNS TESTES FALHARAM!");
        end

        $finish;
    end

endmodule
