module mux2x1 (
    input S,
    input [2:0] D0,
    input [2:0] D1,
    output [2:0] Y
);

    assign Y = (S == 1'b0) ? D0 : D1;
    
endmodule