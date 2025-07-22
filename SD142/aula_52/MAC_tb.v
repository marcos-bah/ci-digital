module MAC_tb;
    reg clk, rst;
    reg [7:0] A, B;
    wire [31:0] result_out;

    MAC dut (
        .A(A), 
        .B(B),
        .clk(clk), 
        .rst(rst),
        .result_out(result_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        A = 1;
        B = 2;
        #10;
        rst = 0;

        // Operar por pelo menos 10 ciclos de clock após reset
        repeat (10) @(posedge clk);
        $finish;
    end

endmodule
