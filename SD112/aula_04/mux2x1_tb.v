module mux2x1_tb();
    reg S;           
    reg D0, D1;
    wire Y;          

    mux2x1 dut (.S(S),.D0(D0), .D1(D1), .Y(Y));

    always begin #1 D0 = !D0; end
    always begin #2 D1 = !D1; end
    always begin #4 S  = !S;  end
         
    initial begin
        D0=0;
        D1=0;
        S=0;
        #8 $stop;
    end

    initial begin
        $monitor("Tempo = %0t | S = %b | Y = %b", $time, S, Y);
    end

endmodule