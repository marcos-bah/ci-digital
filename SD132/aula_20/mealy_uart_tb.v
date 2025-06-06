module mealy_uart_tb;

reg clk;
reg rst;
reg Byte_ready;
reg T_byte;
reg BC_lt_BCMax;

wire Load_XMT_datareg;
wire Load_XMT_DR;
wire Load_XMT_shfreg;
wire start;
wire shift;
wire clear;

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

initial begin
    $display("\nTestbench: mealy_uart_tb");

    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    Byte_ready = 0;
    T_byte = 0;
    BC_lt_BCMax = 0;

    #12 rst = 0;

    // Testa transição de IDLE para WAIT
    #10 Byte_ready = 1;

    #10 Byte_ready = 0;

    // Testa transição de WAIT para SEND
    #10 T_byte = 1;

    #10 T_byte = 0;

    // Testa permanência em SEND com BC_lt_BCMax = 1 (shift)
    #10 BC_lt_BCMax = 1;

    #10 BC_lt_BCMax = 1;

    // Testa transição de SEND para IDLE com BC_lt_BCMax = 0 (clear)
    #10 BC_lt_BCMax = 0;

    // Aguarda e finaliza
    #20 $finish;
end

endmodule
