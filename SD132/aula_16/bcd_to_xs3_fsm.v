module bcd_to_xs3_fsm (
    input wire clk,
    input wire rst,
    input wire in,
    output reg out,
    output [3:0] s_bcd_in,
    output [3:0] s_xs3_out
);

    localparam
        S_WAIT  = 4'd0,
        S_IN_0  = 4'd1,
        S_IN_1  = 4'd2,
        S_IN_2  = 4'd3,
        S_IN_3  = 4'd4,
        S_CONV  = 4'd5,
        S_OUT_0 = 4'd6,
        S_OUT_1 = 4'd7,
        S_OUT_2 = 4'd8,
        S_OUT_3 = 4'd9;

    reg [3:0] state, next_state;
    reg [3:0] bcd_in;
    reg [3:0] xs3_out;

    assign s_xs3_out = xs3_out;
    assign s_bcd_in = bcd_in;

    always @(*) begin
        case(state)
            S_WAIT:  next_state = S_IN_0;
            S_IN_0:  next_state = S_IN_1;
            S_IN_1:  next_state = S_IN_2;
            S_IN_2:  next_state = S_IN_3;
            S_IN_3:  next_state = S_CONV;
            S_CONV:  next_state = S_OUT_0;
            S_OUT_0: next_state = S_OUT_1;
            S_OUT_1: next_state = S_OUT_2;
            S_OUT_2: next_state = S_OUT_3;
            S_OUT_3: next_state = S_IN_0;
            default: next_state = S_WAIT;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S_WAIT;
            bcd_in <= 4'd0;
            xs3_out <= 4'd0;
            out <= 1'b0;
        end else begin
            state <= next_state;
            case(state)
                S_IN_0: bcd_in[0] <= in;
                S_IN_1: bcd_in[1] <= in;
                S_IN_2: bcd_in[2] <= in;
                S_IN_3: bcd_in[3] <= in;
                S_CONV: xs3_out <= bcd_in + 4'd3;
                S_OUT_0: out <= xs3_out[0];
                S_OUT_1: out <= xs3_out[1];
                S_OUT_2: out <= xs3_out[2];
                S_OUT_3: out <= xs3_out[3];
                default: out <= 1'b0;
            endcase
        end
    end

endmodule
