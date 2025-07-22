module mac_tb;
reg clk, rst;
reg signed[7:0] A;
reg signed[7:0] B;
wire signed[31:0] result_out;

MAC  MAC_inst (
    .A(A),
    .B(B),
    .clk(clk),
    .rst(rst),
    .result_out(result_out)
  );

initial begin
    rst = 1;
    clk = 0;
end

//clock
always clk = #1 ~clk;

//reset
initial begin
    #2 rst = 0;
    #20 rst = 1;
    #2 rst = 0;
end

//entradas
initial begin
    A = 8'd2;
    B = 8'd1;
    #4 A = 4;
    B = 5;
    #4 A = -2;
    B = -4;
end

//tempo total de simulação
initial #40 $stop;

endmodule