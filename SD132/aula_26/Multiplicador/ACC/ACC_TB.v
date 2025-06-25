module ACC_TB();

parameter DATA_LENGTH = 4;

reg Clk, Sh, Ad, Load, rst;
reg  [2*DATA_LENGTH:0] Entradas;
wire [2*DATA_LENGTH:0] Saidas;

ACC #(DATA_LENGTH) dut (
    .Load(Load), .Sh(Sh), .Ad(Ad), .Clk(Clk), .rst(rst),
    .Entradas(Entradas), .Saidas(Saidas)
);

initial begin
    Clk = 0;
    forever #5 Clk = ~Clk;
end

initial begin
    rst = 1;
    Load = 0;
    Sh = 0;
    Ad = 0;
    Entradas = 0;
    #10;

    rst = 0;
    #10;

    Entradas = 9'b001_101001;
    Load = 1;
    #10;

    Load = 0;
    #10;

    Entradas = 9'b110_010000;
    Ad = 1;
    #10;

    Ad = 0;
    #10;

    Sh = 1;
    #10;

    Sh = 0;
    #10;

    Sh = 1;
    #10;

    Sh = 0;

    Entradas = 9'b000_000011;
    Load = 1; Sh = 0; Ad = 0;
    #10 Load = 0; Sh = 1; Ad = 0;
    #10 Load = 1; Sh = 0; Ad = 1;

    // Overflow
    Entradas = 9'b1_11111111;
    #10 Load = 1; Sh = 0; Ad = 0;
    #10 Load = 0; Sh = 1; Ad = 0;

    // Underflow
    Entradas = 9'b0_00000000;
    #10 Load = 1; Sh = 0; Ad = 0;
    #10 Load = 0; Sh = 1; Ad = 0;

    #10;
    $stop;
end

endmodule
