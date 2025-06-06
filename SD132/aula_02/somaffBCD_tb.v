module somaffBCD_tb;
    reg clk, rst, EN1, EN2, EN3, EN4;
    reg [3:0] entrada;
    wire [7:0] s;
    reg [3:0] ctrl;

    somaffBCD DUT (entrada, clk, rst, EN1, EN2, EN3, EN4, s);

    initial begin
        clk = 0; rst = 1; EN1 = 0; EN2 = 0;  EN3 = 0;  EN4 = 0; entrada = 4'b0011; ctrl = 4'b1000;
    end

    always @(*) begin
        {EN1, EN2, EN3, EN4} = ctrl;
    end

    initial begin #25 rst = 0; end

    initial begin #40 entrada = 4'b0001; end

    initial begin #60 entrada = 4'b0010; end

    initial begin #80 entrada = 4'b0100; end

    always #10 clk = ~clk;

    always @(negedge clk)
    begin
        if (rst) ctrl = 4'b1000;
        else ctrl = {ctrl[0], ctrl[3:1]};

        {EN1, EN2, EN3, EN4} = ctrl;
    end

    initial #160 $stop;
endmodule