module verificador_paridade #(
    parameter DATA_WIDTH = 8
)(
    input wire [DATA_WIDTH:0] data_in, //com o bit
    output error             
);
    assign error = ^data_in;
endmodule
