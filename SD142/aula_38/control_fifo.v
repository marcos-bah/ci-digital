module control_fifo(rst, clk, w_addr, wr, full, r_addr, rd, empty);
    input rst, clk;
    output [2:0] w_addr, r_addr;
    input wr, rd;
    output full, empty;

    reg [3:0] w_ptr_out, r_ptr_out;

    assign w_addr = w_ptr_out[2:0];
    assign r_addr = r_ptr_out[2:0];

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            w_ptr_out <= 4'b0;
            r_ptr_out <= 4'b0;
        end else begin
            if (wr & !full)
                w_ptr_out <= w_ptr_out + 1'b1;
            if (rd & !empty)
                r_ptr_out <= r_ptr_out + 1'b1;
        end
    end

    assign full = ((w_ptr_out[3] != r_ptr_out[3]) & (w_addr == r_addr)) ? 1'b1 : 1'b0;
    assign empty = (r_ptr_out == w_ptr_out) ? 1'b1 : 1'b0;
endmodule
