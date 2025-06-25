module regAQ #(parameter N = 4) (
    input [N-1:0] dividendo, 
    input [N:0] operando,
    input load, clk, rst, shift, hab_A, set_Q0,
    output reg [N:0] regA,
    output reg [N-1:0] regQ
);

always @(posedge clk, posedge rst) begin
    if (rst) begin
        regA <= 0;
        regQ <= 0;
    end else if (load) begin
        regA <= 0;
        regQ <= dividendo;
    end else if (shift) begin
        {regA, regQ} <= {regA, regQ} << 1;
    end else if (hab_A) begin
        regA <= operando;
    end else if (set_Q0) begin
        regQ[0] <= 1;
    end
end
    
endmodule