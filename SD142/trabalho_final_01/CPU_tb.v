module CPU_tb();

  reg clk, reset;
  wire [31:0] WriteData, DataAddr;
  wire MemWrite;

  // Clock: alterna a cada 10 unidades de tempo
  always #10 clk = ~clk;

  // Instância da CPU
  CPU DUT (
    .clk(clk),
    .reset(reset),
    .WriteData(WriteData),
    .DataAddr(DataAddr),
    .MemWrite(MemWrite)
  );

  initial begin
    // Inicialização
    clk = 0;
    reset = 1;
    #20 reset = 0;

    // Roda a simulação por um tempo
    #1500;

    $stop;
  end

  // Monitoramento da escrita na memória
  always @(posedge clk) begin
    if (MemWrite) begin
      if (DataAddr == 32'd104 && WriteData == 32'd25) begin
        $display("PASSOU: 25 foi escrito no endereço 104");
        $stop;
      end else begin
        $display("FALHOU: Dados incorretos. Addr: %0d, Dado: %0d", DataAddr, WriteData);
        //$stop;
      end
    end
  end

endmodule
