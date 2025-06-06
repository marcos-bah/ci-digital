module fsm_borda (
    input input_bit,
    input clk,
    input rst,
    output reg output_bit
);

localparam IDLE  = 2'd0;
localparam PULSE = 2'd1;

reg [1:0] state;
reg prev_input;

wire edge_detected;

assign edge_detected = (input_bit != prev_input);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        prev_input <= 0;
        output_bit <= 0;
    end else begin
        prev_input <= input_bit;

        case (state)
            IDLE: begin
                if (edge_detected) begin
                    output_bit <= 1'b1;
                    state <= PULSE;
                end else begin
                    output_bit <= 1'b0;
                    state <= IDLE;
                end
            end

            PULSE: begin
                output_bit <= 1'b0;

                if (edge_detected) begin
                    output_bit <= 1'b1;
                    state <= PULSE;
                end else begin
                    state <= IDLE;
                end
            end

            default: begin
                output_bit <= 1'b0;
                state <= IDLE;
            end
        endcase
    end
end

endmodule
