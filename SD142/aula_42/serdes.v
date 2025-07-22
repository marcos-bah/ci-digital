module serdes #(
    parameter DATA_WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire load,
    input wire [DATA_WIDTH-1:0] data_in,
    input wire enable,
    output wire [DATA_WIDTH-1:0] data_out,
    output wire done, ready_tx, ready_rx,
    output wire paridade_error
);

    wire serial;

    serializer #(.DATA_WIDTH(DATA_WIDTH)) s (
        .clk(clk),
        .rst(rst),
        .load(load),
        .data_in(data_in),
        .serial_out(serial),
        .ready_tx(ready_tx)
    );

    deserializer #(.DATA_WIDTH(DATA_WIDTH)) d (
        .clk(clk),
        .rst(rst),
        .serial_in(serial),
        .enable(enable),
        .data_out(data_out),
        .done(done),
        .paridade_error(paridade_error),
        .ready_rx(ready_rx)
    );

endmodule
