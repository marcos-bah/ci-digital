module comparador (
    input [1:0] x1, x2,
    output reg y
);

    reg A, B, C, D;

    always@(*) begin
        {A, B} = x1;
        {C, D} = x2;

        y = (~A & ~B & ~C & ~D) 
            | (~A & B & ~C & D) 
            | (A & B & C & D) 
            | (A & ~B & C & D);
    end
endmodule