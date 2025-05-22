module q4_4_adder_subtractor (
    input  wire signed [7:0] a,
    input  wire [7:0] b,
    input  wire       op,
    input  wire       cin,
    output reg  [7:0] result,
    output reg        cout
);

    reg signed [8:0] temp_result;
    reg signed [7:0] a_signed, b_signed;
    reg signed [8:0] b_modified;

    always @(*) begin
        a_signed = a;
        b_signed = b;

        if (op == 1'b0)
            b_modified = b_signed + (cin << 4);
        else
            b_modified = -b_signed + (cin << 4);

        temp_result = a_signed + b_modified;

        if (temp_result > 127) begin
            result = 8'sd127;
            cout = 1'b1;
        end else if (temp_result < -128) begin
            result = -128;
            cout = 1'b1;
        end else begin
            result = temp_result[7:0];
            cout = 1'b0;
        end
    end

endmodule
