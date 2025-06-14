module mealy_uart_tb;

  reg clk, rst;
  reg Byte_ready, T_byte, BC_lt_BCMax;
  reg Load_XMT_datareg;

  wire Load_XMT_DR, Load_XMT_shfreg, start, shift, clear;

  mealy_uart dut (
    .clk(clk),
    .rst(rst),
    .Byte_ready(Byte_ready),
    .T_byte(T_byte),
    .BC_lt_BCMax(BC_lt_BCMax),
    .Load_XMT_datareg(Load_XMT_datareg),
    .Load_XMT_DR(Load_XMT_DR),
    .Load_XMT_shfreg(Load_XMT_shfreg),
    .start(start),
    .shift(shift),
    .clear(clear)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    Byte_ready = 0;
    T_byte = 0;
    BC_lt_BCMax = 0;
    Load_XMT_datareg = 0;

    // Reset ativo por 10 unidades
    #10 rst = 0;

    // ==== Transmissão 1 ====
    #10 Load_XMT_datareg = 1;
    #10 Load_XMT_datareg = 0;

    #10 Byte_ready = 1;
    #10 Byte_ready = 0;

    #10 T_byte = 1;
    #10 T_byte = 0;

    #10 BC_lt_BCMax = 1;
    #20 BC_lt_BCMax = 0;

    // ==== Transmissão 2 ====
    #20 Load_XMT_datareg = 1;
    #10 Load_XMT_datareg = 0;

    #10 Byte_ready = 1;
    #10 Byte_ready = 0;

    #10 T_byte = 1;
    #10 T_byte = 0;

    #10 BC_lt_BCMax = 1;
    #20 BC_lt_BCMax = 0;

    #20 $stop;
  end
endmodule
