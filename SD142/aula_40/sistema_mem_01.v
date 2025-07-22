module sistema_mem_01 (
    input we, clk,
    input [15:0] addr,
    input [7:0] din,
    output [7:0] dout,
    output cs
);

wire [9:0] addr_mem;

assign addr_mem = addr[9:0];

decodificador dec (
    .clk(clk),
    .addr(addr),
    .cs(cs)
);

single_port_ram ram (
    .clk(clk),
    .we(we),
    .cs(cs),
    .addr(addr_mem),
    .din(din),
    .dout(dout)
);
    
endmodule