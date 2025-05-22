module somador_behave (
    input A,        // Primeiro bit
    input B,        // Segundo bit
    input Cin,      // Carry in
    output reg S,   // Soma
    output reg Cout // Carry out
);
always @(*) begin
    // Soma final
    S = A ^ B ^ Cin; // XOR para a soma binária
    // Carry out utilizando porta XOR
    Cout = (A & B) | (Cin & (A ^ B)); 
    // A explicação detalhada está abaixo.
end
endmodule
