module deserializer #(
    parameter DATA_WIDTH = 8
)(
    input wire clk,
    input wire rst,
    input wire serial_in,
    input wire enable,
    output reg [DATA_WIDTH-1:0] data_out,
    output reg done,
    output reg paridade_error, ready_rx
);
    reg [DATA_WIDTH-1:0] shift_reg;
    reg [$clog2(DATA_WIDTH+1)-1:0] bit_cnt;
    wire bit_error_paridade;
    reg [DATA_WIDTH:0] w_data_out;

    verificador_paridade #(.DATA_WIDTH(DATA_WIDTH)) v (
        .data_in(w_data_out),
        .error(bit_error_paridade)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= {DATA_WIDTH{1'b0}};
            bit_cnt <= 0;
            done <= 0;
            paridade_error <= 0;
            w_data_out <= {DATA_WIDTH{1'b0}};
            ready_rx <= 1;
        end else if (enable) begin
            shift_reg <= {shift_reg[DATA_WIDTH-2:0], serial_in};
            bit_cnt <= bit_cnt + 1;
            if (bit_cnt == DATA_WIDTH ) begin
                w_data_out <= {shift_reg, serial_in}; 
                data_out <= {shift_reg[DATA_WIDTH-1:0], serial_in};
                paridade_error <= bit_error_paridade;
                done <= 1;
            end else begin
                ready_rx <= 0;
                done <= 0;
            end
        end
    end

endmodule
