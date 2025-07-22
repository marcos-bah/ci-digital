module sistema_mem_02 (
    input we, clk,
    input [15:0] addr,
    input [7:0] din,
    output [3:0] cs,
    output reg [7:0] dout
);

wire [9:0] addr_mem;
wire [7:0] dout_ram[3:0];

assign addr_mem = addr[9:0];

decodificador_4faixas dec (
    .clk(clk),
    .addr(addr),
    .cs(cs)
);

single_port_ram ram01 (
    .clk(clk),
    .we(we),
    .cs(cs[0]),
    .addr(addr_mem),
    .din(din),
    .dout(dout_ram[0])
);

single_port_ram ram02 (
    .clk(clk),
    .we(we),
    .cs(cs[1]),
    .addr(addr_mem),
    .din(din),
    .dout(dout_ram[1])
);

single_port_ram ram03 (
    .clk(clk),
    .we(we),
    .cs(cs[2]),
    .addr(addr_mem),
    .din(din),
    .dout(dout_ram[2])
);

single_port_ram ram04 (
    .clk(clk),
    .we(we),
    .cs(cs[3]),
    .addr(addr_mem),
    .din(din),
    .dout(dout_ram[3])
);

always @(*) begin
    case (cs)
        4'b0001: dout = dout_ram[0];
        4'b0010: dout = dout_ram[1];
        4'b0100: dout = dout_ram[2];
        4'b1000: dout = dout_ram[3];
        default: dout = 8'bz;  
    endcase
end
    
endmodule