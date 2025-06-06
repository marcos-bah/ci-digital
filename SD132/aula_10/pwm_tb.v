module pwm_tb;

reg clk, rst, load;
reg [3:0] duty;
wire out;

pwm uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .duty(duty),
    .out(out)
);

initial begin
    $display("\nPWM TEST\n");
    $monitor("clk=%b rst=%b load=%b duty=%d out=%b", clk, rst, load, duty, out);

    clk = 0;
    rst = 1;
    load = 0;
    duty = 0;

    #5 rst = 0;
    #5 load = 1; duty = 4'd8;
    #5 load = 0;
    #100;

    #5 load = 1; duty = 4'd12;
    #5 load = 0;
    #100;

    #5 load = 1; duty = 4'd4;
    #5 load = 0;
    #100;

    $finish;
end

always #1 clk = ~clk;

endmodule
