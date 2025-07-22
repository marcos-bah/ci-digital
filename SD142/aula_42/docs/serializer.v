module serializer (
    input wire clk,
    input wire rst,
    input wire load,
    input wire [7:0] data_in,
    output reg serial_out
);
    reg [7:0] shift_reg;
    reg [3:0] bit_cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 8'd0;
            bit_cnt <= 4'd0;
            serial_out <= 0;
        end else begin
            if (load) begin
                shift_reg <= data_in;
                bit_cnt <= 4'd8;
            end else if (bit_cnt != 4'd0) begin
                serial_out <= shift_reg[7];
                shift_reg <= shift_reg << 1;
                bit_cnt <= bit_cnt - 1;
            end
        end
    end

endmodule