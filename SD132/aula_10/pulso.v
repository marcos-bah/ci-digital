module pulso (
    input a,
    output b
);
    wire w1;
    not #5 i1 (w1, a);
    and i2 (b, a, w1);
endmodule
