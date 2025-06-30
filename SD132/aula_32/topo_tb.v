module topo_tb;

    reg clk, rst;

    topo uut (
        .clk(clk),
        .rst(rst)
    );

    initial begin
        $display("\nTESTBENCH TOPO");

        clk = 0;
        rst = 1;
        #10 rst = 0;

        #200 $finish;
    end

    always #5 clk = ~clk;

endmodule
