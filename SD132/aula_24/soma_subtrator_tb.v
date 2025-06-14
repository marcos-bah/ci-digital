module soma_subtrator_tb;
    reg [3:0] a;
    reg [3:0] b;
    reg op;
    wire [3:0] resultado;
    wire carryout;
    wire overflow;

    soma_subtrator uut (
        .a(a),
        .b(b),
        .op(op),
        .resultado(resultado),
        .carryout(carryout),
        .overflow(overflow)
    );

    initial begin
        a = 4'b0000; b = 4'b0000; op = 0; #10;
        a = 4'b0011; b = 4'b0001; op = 0; #10;
        a = 4'b0100; b = 4'b0010; op = 1; #10;
        a = 4'b1000; b = 4'b1000; op = 0; #10;
        a = 4'b1000; b = 4'b1000; op = 1; #10;
        a = 4'b1111; b = 4'b0001; op = 0; #10;
        a = 4'b0111; b = 4'b1111; op = 1; #10;
        $finish;
    end

endmodule
