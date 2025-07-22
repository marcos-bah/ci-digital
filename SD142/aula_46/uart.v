module uart #(
    parameter integer CLOCK_HZ = 50_000_000,     // Frequência do clock (Hz)
    parameter integer BAUD_RATE = 9600           // Baud rate desejado
)(
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    input wire tx_start,
    output wire tx,
    output wire rx_done,
    output wire tx_done, paridade_error,
    output wire [7:0] data_out
);

    reg tx_delayed;

    always @(posedge clk) begin
        tx_delayed <= tx;
    end

    uart_tx #(
            .BAUD_RATE(BAUD_RATE), 
            .CLOCK_HZ(CLOCK_HZ)
        ) uut_tx (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .tx_start(tx_start),
        .tx(tx),
        .tx_done(tx_done)
    );

    uart_rx #(
            .BAUD_RATE(BAUD_RATE), 
            .CLOCK_HZ(CLOCK_HZ)
        ) uut_rx (
        .clk(clk),
        .reset(reset),
        .rx(tx_delayed),
        .data_out(data_out),
        .rx_done(rx_done),
        .paridade_error(paridade_error)
    );
endmodule
