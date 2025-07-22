module sync_ram_single_port(
    input clk, cs, we,
    input [8:0] addr,
    input [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] mem [0:511];

always @(posedge clk) begin
    if (cs) begin
        if (!we) begin
            mem[addr] <= data_in;
        end else begin
            data_out <= mem[addr];
        end
    end
end

endmodule
