
module DataMemory_tb;

    reg clk;
    reg WE;
    reg [31:0] A;
    reg [31:0] WD;
    wire [31:0] RD;

    DataMemory dut (
        .clk(clk),
        .WE(WE),
        .A(A),
        .WD(WD),
        .RD(RD)
    );

    always #5 clk = ~clk;

    initial begin
        $display("=== Testbench: leitura da posição x200 (índice 0x200) ===");
        $monitor("t=%0t | WE=%b | A=0x%08h | RD=0x%08h", $time, WE, A, RD);

        clk = 0;
        WE  = 0;
        A   = 0;
        WD  = 0;

        #10;

        // Lê a posição 0x200 (RAM[512])
        A = 32'h200;  // índice direto da memória
        #1;

        if (RD !== 32'd10) begin
            $display("ERRO: Esperado RD = 10, obtido RD = %0d", RD);
        end else begin
            $display("SUCESSO: Leitura correta da posição x200: RD = %0d", RD);
        end

        #10;
        $display("=== Fim do Testbench ===");
        $finish;
    end

endmodule