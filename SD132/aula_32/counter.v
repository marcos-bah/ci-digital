module pc (
    input clk, ena, rst,
    output reg [7:0] addr_bus,
    output reg ack
);

    always @(negedge clk) begin
        if (rst) begin
            addr_bus <= 8'b00000000;
            ack <= 0;
        end else if (ena) begin
            addr_bus <= addr_bus + 1;
            ack <= 1;
        end else begin
            ack <= 0;
        end
    end

endmodule
