module somador_bcd (
    input Cin,
    input [3:0] A, B,
    output reg [3:0] Y,
    output reg Cout
);

    reg [4:0] IntermediateSum;

    always @(*) begin
        IntermediateSum = (A + B + Cin);
        {Cout, Y} = IntermediateSum > 9 ? IntermediateSum + 5'b00110 : IntermediateSum;
    end
    
endmodule