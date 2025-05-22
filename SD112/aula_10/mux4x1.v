module mux4x1 (
    input D0, D1, D2, D3,
    input [1:0] S,
    output reg Y
);
    always @ (D0, D1, D2, D3, S) begin
        if (S == 2'b00)
            Y = D0;
        else begin
            if (S == 2'b01)
                Y = D1;
            else if (S == 2'b10)
                Y = D2;
            else
                Y = D3;
        end
    end
endmodule