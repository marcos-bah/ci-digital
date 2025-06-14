module fsm_tb;

    reg clk;
    reg rst;
    reg fimA, fimB, fimOp;
    wire habA, habB, habOp;

    fsm uut (
        .clk(clk),
        .rst(rst),
        .fimA(fimA),
        .fimB(fimB),
        .fimOp(fimOp),
        .habA(habA),
        .habB(habB),
        .habOp(habOp)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        fimA = 0;
        fimB = 0;
        fimOp = 0;

        #12;
        rst = 0;

        #10;
        #10;
        fimA = 1;
        fimB = 0;

        #10;
        fimB = 1;

        #10;
        fimOp = 0;

        #10;
        fimOp = 1;

        #10;
        fimA = 0;
        fimB = 0;
        fimOp = 0;

        #10;
        fimA = 1;
        fimB = 1;

        #10;
        fimOp = 1;

        #20;
        $finish;
    end

endmodule
