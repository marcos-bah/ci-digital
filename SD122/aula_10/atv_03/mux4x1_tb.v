module mux4x1_tb();
    reg [2:0] A;
    reg [2:0] B;
    reg [2:0] C;
    reg [2:0] D;
    reg [1:0] sel; 
    wire [2:0] out;

    mux4x1 #(3) uut (.A(A), .B(B), .C(C), .D(D), .sel(sel), .out(out));

    initial begin
        A = 3'b101;
        B = 3'b111;
        C = 3'b000;
        D = 3'b100;
        $display("\n");
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
    end

    initial begin
        $monitor("Tempo: %0t | Entrada: %b - %b - %b - %b | Sel %b | Saída: %b", $time ,A, B, C, D, sel, out);
    end

endmodule