module deserializer (
    input wire clk,
    input wire rst,
    input wire serial_in,
    input wire enable,
    output reg [7:0] data_out,
    output reg done
);
    reg [7:0] shift_reg;
    reg [3:0] bit_cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 8'd0;
            bit_cnt <= 4'd0;
            done <= 0;
        end else if (enable) begin
            shift_reg <= {shift_reg[6:0], serial_in};
            bit_cnt <= bit_cnt + 1;
            if (bit_cnt == 4'd8) begin
                data_out <= {shift_reg[6:0], serial_in};
                done <= 1;
            end else begin
                done <= 0;
            end
        end
    end

endmodule