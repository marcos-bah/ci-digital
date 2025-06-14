module drink (
    input wire clk, rst, confirma, moeda,
    input wire [1:0] op,
    output reg entrega_agua, entrega_fanta, entrega_guarana,
    output reg sinal_devolve,
    output reg [3:0] troco,
    output reg [3:0] saldo
);

localparam
    S_START  = 3'b000,
    S_WAIT   = 3'b001,
    S_VERIFY = 3'b010,
    S_SEND   = 3'b011,
    S_CHANGE = 3'b100,
    S_RETURN = 3'b101;

reg [2:0] state;
reg [3:0] preco;
reg [3:0] saldo_reg;
reg rstCount;

wire [3:0] saldo_value;

contador_saldo contador (
    .moeda(moeda),
    .rst(rstCount),
    .saldo(saldo_value)
);

always @(*) begin
    case (op)
        2'b00: preco = 4'd4;
        2'b01: preco = 4'd6;
        2'b10: preco = 4'd5;
        default: preco = 4'd15;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        rstCount <= 0;
        state <= S_START;
        entrega_agua <= 0;
        entrega_fanta <= 0;
        entrega_guarana <= 0;
        sinal_devolve <= 0;
        troco <= 0;
        saldo_reg <= 0;
        saldo <= 0;
    end else begin
        entrega_agua <= 0;
        entrega_fanta <= 0;
        entrega_guarana <= 0;
        sinal_devolve <= 0;
        troco <= 0;
        rstCount <= 0;

        case (state)
            S_START: begin
                saldo_reg <= saldo_value;
                saldo <= saldo_value;
                state <= S_WAIT;
            end

            S_WAIT: begin
                if (confirma)
                    state <= S_VERIFY;
                else begin
                    saldo <= saldo_value;
                    state <= S_WAIT;
                end
            end

            S_VERIFY: begin
                $display("DEBUG: time=%0t saldo_value=%d preco=%d", $time, saldo_value, preco);
                if (saldo_value >= preco) begin
                    rstCount <= 1;
                    state <= S_SEND;
                end else begin
                    state <= S_RETURN;
                end
            end

            S_SEND: begin
                case (op)
                    2'b00: entrega_agua <= 1;
                    2'b01: entrega_fanta <= 1;
                    2'b10: entrega_guarana <= 1;
                    default: begin end
                endcase
                troco <= saldo_value - preco;
                saldo_reg <= 0;
                saldo <= 0;
                state <= S_CHANGE;
            end

            S_CHANGE: begin
                saldo <= 0;
                state <= S_START;
            end

            S_RETURN: begin
                sinal_devolve <= 1;
                saldo <= 0;
                saldo_reg <= 0;
                state <= S_START;
            end

            default: state <= S_START;
        endcase
    end
end

endmodule
