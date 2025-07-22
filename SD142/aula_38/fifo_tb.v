module fifo_tb;

    reg clk, rst, wr, rd;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    fifo uut (
        .rst(rst), .clk(clk), .data_in(data_in),
        .wr(wr), .full(full), .data_out(data_out),
        .rd(rd), .empty(empty)
    );

    initial begin
        $display("\nTestbench do modulo FIFO");
        clk = 0;
        rst = 1;
        wr = 0;
        rd = 0;
        data_in = 0;
        #5 rst = 0;

        repeat (8) begin
            @(negedge clk);
            if (!full) begin
                wr = 1;
                data_in = data_in + 8'd1;
            end
        end
        wr = 0;

        repeat (8) begin
            @(negedge clk);
            if (!empty)
                rd = 1;
        end
        rd = 0;

        #10 $finish;
    end

    always #2 clk = ~clk;

endmodule
