module mealy_uart (
    input wire clk,
    input wire rst,
    input wire Byte_ready,
    input wire T_byte,
    input wire BC_lt_BCMax,
    input wire Load_XMT_datareg,
    output reg Load_XMT_DR,
    output reg Load_XMT_shfreg,
    output reg start,
    output reg shift,
    output reg clear
);

localparam
    S_IDLE = 2'b00,
    S_WAIT = 2'b01,
    S_SEND = 2'b10;

reg [1:0] state;

always @(*) begin
    Load_XMT_DR = 0;
    Load_XMT_shfreg = 0;
    start = 0;
    shift = 0;
    clear = 0;

    case (state)
        S_IDLE: begin
            if (Load_XMT_datareg)
                Load_XMT_DR = 1'b1;
            if (Byte_ready)
                Load_XMT_shfreg = 1'b1;
        end

        S_WAIT: begin
            if (T_byte)
                start = 1'b1;
        end

        S_SEND: begin
            if (BC_lt_BCMax)
                shift = 1'b1;
            else
                clear = 1'b1;
        end

        default: begin
            Load_XMT_DR = 0;
            Load_XMT_shfreg = 0;
            start = 0;
            shift = 0;
            clear = 0;
        end
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= S_IDLE;
    else begin
        case (state)
            S_IDLE: begin
                if (Byte_ready)
                    state <= S_WAIT;
                if (Load_XMT_datareg)
                    state <= S_IDLE;
            end

            S_WAIT: begin
                if (T_byte)
                    state <= S_SEND;
            end

            S_SEND: begin
                if (BC_lt_BCMax)
                    state <= S_SEND;
                else 
                    state <= S_IDLE;
            end

            default: state <= S_IDLE;
        endcase
    end
end

endmodule
