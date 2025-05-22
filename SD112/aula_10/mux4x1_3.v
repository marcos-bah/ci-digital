module mux4x1_3 (
    input D0, D1, D2, D3,
    input [1:0] S,
    output reg Y
);
    always @ (D0, D1, D2, D3, S) begin
        Y = (~S[0] & ~S[1] & D0) 
        | (~S[0] & S[1] & D2) 
        | (S[0] & ~S[1] & D1) 
        | (S[0] & S[1] & D3);
    end
endmodule