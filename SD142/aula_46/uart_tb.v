module uart_tb;

    localparam BAUD_RATE = 9600;
    localparam CLOCK_HZ = 50_000_000;

    reg clk, reset, tx_start;
    reg [7:0] data_in;
    wire tx, rx_done, tx_done, paridade_error;
    wire [7:0] data_out;

    localparam CLK_PER_BIT = CLOCK_HZ / BAUD_RATE;
    localparam CLK_PERIOD = 1_000_000_000 / CLOCK_HZ;

    uart #(.BAUD_RATE(BAUD_RATE), .CLOCK_HZ(CLOCK_HZ)) uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .tx_start(tx_start),
        .tx(tx),
        .rx_done(rx_done),
        .tx_done(tx_done),
        .data_out(data_out),
        .paridade_error(paridade_error)
    );

    integer i;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    task test_byte(input [7:0] byte);
        begin
            data_in = byte;
            tx_start = 1;
            #(CLK_PERIOD);
            tx_start = 0;

            wait (tx_done);
            wait (rx_done);

            if (data_out == byte)
                $display("PASS: Data: %h", data_out);
            else
                $display("FAIL: Data: Sent %h, Received %h, Paridade error: %b", byte, data_out, paridade_error);
            
            #(10 * CLK_PERIOD);

            reset = 1;

            #(10 * CLK_PERIOD);

            reset = 0;

            #(10 * CLK_PERIOD);
        end
    endtask

    initial begin
        $display("\nTestbench UART");
        reset = 1;
        tx_start = 0;
        data_in = 8'b0;
        #(10 * CLK_PERIOD);
        reset = 0;

        test_byte(8'hf5);

        $finish;
    end
endmodule
