module at_xx_tb();
    wire S, NS;
    reg A, B, C, D;

    at_16 uut(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .NS(NS),
        .S(S)
    );

    initial begin
        A = 0; 
        B = 0;
        C = 0;
        D = 0;
        #10 A = 0;
        B = 0;
        C = 1;
        #10 A = 0;
        B = 1;
        C = 0;
        #10 A = 0;
        B = 1;
        C = 1;
        A = 1;
        B = 0;
        C = 0;
        #10 A = 1;
        B = 0;
        C = 1;
        #10 A = 1;
        B = 1;
        C = 0;
        #10 A = 1;
        B = 1;
        C = 1;

        #10;
    end

endmodule
