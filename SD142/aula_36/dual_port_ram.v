module dual_port_ram(
    input clk, cs,
    input we_a,
    input [8:0] addr_a,
    input [7:0] data_in_a,
    output reg [7:0] data_out_a,
    input [8:0] addr_b,
    output reg [7:0] data_out_b
);

reg [7:0] mem [0:511];

always @(posedge clk) begin
    if (cs) begin
        if (we_a)
            mem[addr_a] <= data_in_a;
        else
            data_out_a <= mem[addr_a];
        data_out_b <= mem[addr_b];
    end
end

endmodule
