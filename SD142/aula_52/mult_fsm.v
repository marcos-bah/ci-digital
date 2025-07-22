module mult_fsm (
    input wire clk, rst,
    input wire [3:0] A, B,
    output reg [7:0] produto,
    output reg done
);

    reg [2:0] state;
    reg [2:0] next_state;

    localparam IDLE = 3'd0;
    localparam RUN  = 3'd1;
    localparam DONE = 3'd2;

    reg [3:0] a_reg, b_reg;
    reg [7:0] acc;
    reg [2:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            acc <= 8'd0;
            produto <= 8'd0;
            done <= 1'b0;
        end else begin
            state <= next_state;

            case (state)
                IDLE: begin
                    a_reg <= A;
                    b_reg <= B;
                    acc <= 8'd0;
                    count <= 3'd0;
                    done <= 1'b0;
                end

                RUN: begin
                    if (b_reg[0])
                        acc <= acc + {4'b0000, a_reg};
                    b_reg <= b_reg >> 1;
                    a_reg <= a_reg << 1;
                    count <= count + 1;
                end

                DONE: begin
                    produto <= acc;
                    done <= 1'b1;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            IDLE: next_state = RUN;
            RUN:  next_state = (count == 4) ? DONE : RUN;
            DONE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

endmodule
