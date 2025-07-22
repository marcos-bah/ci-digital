module serializer #(
    parameter DATA_WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire load,
    input wire [DATA_WIDTH-1:0] data_in,
    output reg serial_out, ready_tx
);
    reg [DATA_WIDTH-1:0] shift_reg;
    reg [$clog2(DATA_WIDTH+1)-1:0] bit_cnt;
    wire bit_paridade;

    paridade_par #(.DATA_WIDTH(DATA_WIDTH)) p (
        .data_in(data_in),
        .bit_paridade(bit_paridade)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= {DATA_WIDTH{1'b0}};
            bit_cnt <= 0;
            serial_out <= 0;
            ready_tx <= 1;
        end else begin
            if (load) begin
                shift_reg <= {bit_paridade, data_in};
                bit_cnt <= DATA_WIDTH + 1;
                ready_tx <= 0;
            end else if (bit_cnt != 0) begin
                serial_out <= shift_reg[DATA_WIDTH-1];
                shift_reg <= shift_reg << 1;
                bit_cnt <= bit_cnt - 1;
                ready_tx <= 0;
            end 
        end
    end

endmodule
