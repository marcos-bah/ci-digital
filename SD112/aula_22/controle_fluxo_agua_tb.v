module controle_fluxo_agua_tb();
    reg A, B, C;
    wire S_mintermos, S_maxtermos, S_karnaugh;
    integer i = 0;
    initial begin
        {A, B, C} = 0;
        for (i = 0; i < 8; i = i + 1) 
            #10 {A, B, C} = i;
        #10;
    end
    controle_fluxo_agua DUT (
        .A(A),
        .B(B),
        .C(C),
        .S_mintermos(S_mintermos),
        .S_maxtermos(S_maxtermos),
        .S_karnaugh(S_karnaugh)
    ); 
endmodule
