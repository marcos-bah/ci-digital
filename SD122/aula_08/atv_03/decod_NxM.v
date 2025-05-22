module decod_NxM #(parameter N = 4) (
    input  wire [N-1:0] in,  
    output reg  [(2**N)-1:0] out     
);

    integer i;
    always @(*) begin
        out = 0; 
        if (in > 0 & in < (2**N)) begin
            out[in-1] = 1;
        end
    end

endmodule