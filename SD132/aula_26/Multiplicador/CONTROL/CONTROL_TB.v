module CONTROL_TB();

reg Clk, k, St, M, rst;
wire Idle, Done, Load, Sh, Ad;

CONTROL dut (
    .Clk(Clk),
    .k(k),
    .St(St),
    .M(M),
    .rst(rst),
    .Idle(Idle),
    .Done(Done),
    .Load(Load),
    .Sh(Sh),
    .Ad(Ad)
);

always #5 Clk = ~Clk;

initial begin
    rst = 1;
    Clk = 0;
    k = 0;
    St = 0;
    M = 0;
    #10 rst = 0;
    #12;
    $monitor("Tempo: %t | St=%b k=%b M=%b | Idle=%b Load=%b Ad=%b Sh=%b Done=%b", $time, St, k, M, Idle, Load, Ad, Sh, Done);

    St = 1;
    #10;
    St = 0;
    #10;

    repeat (2) begin
        k = 0;
        M = 1;
        #10;
    end

    k = 1;
    M = 0;
    #10;

    #10;
    $stop;
end

endmodule