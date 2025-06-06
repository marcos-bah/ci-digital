module somaff_tb;
    reg clk, rst, hab1, hab2;
    reg [3:0] entrada;
    wire [3:0] s;
    wire cout;

    somaff DUT (entrada, hab1, hab2, clk, rst, s, cout);

    initial begin
        clk = 0; rst = 1; hab1 = 0; hab2 = 0; entrada = 4'b0011;
    end

    initial begin #20 hab2 = 1'b1; end

    initial begin #40 hab1 = 1'b1; end

    initial begin #25 rst = 0; end

    initial begin #120 entrada = 4'b0001; end

    initial begin #140 entrada = 4'b0010; end

    initial begin #160 entrada = 4'b0100; end

    always #10 clk = ~clk;

    initial #200 $stop;
endmodule