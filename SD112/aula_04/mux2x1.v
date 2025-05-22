module mux2x1 (
    input S,
    input D0,
    input D1,
    output Y
);

    wire w_notS, w_and0, w_and1, w_or;
    nand i0 (w_notS, S);
    and i1 (w_and0, w_notS, D0);
    and i2 (w_and1, S, D1);
    or i3 (Y, w_and1, w_and0);
    
endmodule