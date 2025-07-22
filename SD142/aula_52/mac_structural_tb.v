module mac_structural_tb;
    reg clk, rst;
    reg [3:0] A, B;
    wire [15:0] result_out;

    mac_structural uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .result_out(result_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        A = 4'd3;
        B = 4'd4;
        #12;
        rst = 0;

        repeat (10) @(posedge clk);
        $finish;
    end

endmodule
