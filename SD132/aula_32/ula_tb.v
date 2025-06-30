module ula_tb;

    reg [3:0] op1, op2, op_sel;
    reg ena, clk;
    wire [3:0] res;
    wire ula_ack;

    ula uut (
        .op1(op1),
        .op2(op2),
        .op_sel(op_sel),
        .ena(ena),
        .clk(clk),
        .res(res),
        .ula_ack(ula_ack)
    );

    initial begin
        $display("\nTESTBENCH ULA");

        clk = 0;
        ena = 0;
        op1 = 4'b0000;
        op2 = 4'b0000;
        op_sel = 4'b0000;

        #5 ena = 1;

        op1 = 4'b1010; op2 = 4'b0101;

        op_sel = 4'b0100; #10;
        op_sel = 4'b0101; #10;
        op_sel = 4'b0110; #10;
        op_sel = 4'b0111; #10;
        op_sel = 4'b1000; #10;
        op_sel = 4'b1001; #10;
        op_sel = 4'b1010; #10;
        op_sel = 4'b1011; #10;
        op_sel = 4'b1100; #10;
        op_sel = 4'b1101; #10;
        op_sel = 4'b1110; #10;
        op_sel = 4'b1111; #10;

        ena = 0;

        #10 $finish;
    end

    always #5 clk = ~clk;

endmodule
