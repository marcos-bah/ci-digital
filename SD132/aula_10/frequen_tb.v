module frequen_tb;

reg sinal, clk, rst;
wire [7:0] pulsos;

frequen DUT (
    .sinal(sinal),
    .clk(clk),
    .rst(rst),
    .pulsos(pulsos)
);

initial begin
    $display("\nfrequen_tb");

    clk = 0;
    sinal = 0;
    rst = 1;
    #5 rst = 0;

    #400 $stop;
end

always #25 sinal = ~sinal;
always #1 clk = ~clk;

endmodule
