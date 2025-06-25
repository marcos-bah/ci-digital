module Counter_TB();

parameter DATA_LENGTH = 4;

reg Clk, Load, rst;
wire K;

Counter #(DATA_LENGTH) dut (
    .Load(Load),
    .Clk(Clk),
    .rst(rst),
    .K(K)
);

always #5 Clk = ~Clk;

initial begin
    Clk = 0;
    rst = 1;
    Load = 0;
    $monitor("Tempo: %t | Load=%b | K=%b", $time, Load, K);
    #10;
    rst = 0;
    Load = 1;
    #10;
    Load = 0;
    #150;
    Load = 1;
    #10;
    Load = 0;
    #150;
    $stop;
end

endmodule