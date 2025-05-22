module atv_02_tb ();
reg A, B;
reg [4:0] Bin;
wire [4:0] D, Bw;

atv02 uut (.A(A), .B(B), .Bw(Bw), .D(D), .Bin(Bin));

initial begin
    $display("\n");
    $monitor("Bin: %b | A: %b | B: %b | Bw: %b | D: %b", Bin[0], A, B, Bw, D);

    Bin = 5'b00000; A = 0; B = 0; #10;
    Bin = 5'b00000; A = 0; B = 1; #10;
    Bin = 5'b00000; A = 1; B = 1; #10;
    Bin = 5'b00000; A = 1; B = 0; #10;

    Bin = 5'b11111; A = 0; B = 0; #10;
    Bin = 5'b11111; A = 0; B = 1; #10;
    Bin = 5'b11111; A = 1; B = 1; #10;
    Bin = 5'b11111; A = 1; B = 0; #10;
end

endmodule