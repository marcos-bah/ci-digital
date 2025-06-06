module reg_8b_tb;

reg clk;
reg rst;
reg load;
reg [7:0] d;
wire [7:0] q;

reg_8b uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .d(d),
    .q(q)
);

initial begin
    $display("\nTestbench para reg_8b - Registrador de 8 bits com load e reset assíncrono");

    clk = 0;
    rst = 1;
    load = 0;
    d = 8'h00;

    #10 rst = 0;
    #10 d = 8'hA5;
    load = 1;
    #10 load = 0;
    d = 8'h00;

    #20 d = 8'hFF;
    load = 1;
    #10 load = 0;

    #10 rst = 1;
    #10 rst = 0;

    #20 $finish;
end

always #5 clk = ~clk;

endmodule
