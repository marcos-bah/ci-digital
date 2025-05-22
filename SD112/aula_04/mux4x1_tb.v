module mux4x1_tb();
    reg [1:0] S;           
    reg D0, D1, D2, D3;    
    wire Y;          

    mux4x1 dut (.S(S),.D0(D0), .D1(D1), .D2(D2), .D3(D3),.Y(Y));

    always begin #1 D0 = !D0; end
    always begin #2 D1 = !D1; end
    always begin #4 D2 = !D2; end
    always begin #8 D3 = !D3; end  
    always begin #16 S = S+1; end
         
    initial begin
        D0=0;
        D1=0;
        D2=0;
        D3=0;
        S=0;
        #64 $stop;
    end

    initial begin
        $monitor("Tempo = %0t | S = %b | Y = %b", $time, S, Y);
    end

endmodule