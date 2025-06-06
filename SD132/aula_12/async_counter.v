// Contador Assincrono de 3 bits
module async_counter(
    input clk,
    input rst,
    output reg [2:0] q
);

    wire [2:0] qn;
	 wire j, k;

	 assign qn = ~q;
	 assign j = 1'b1;
	 assign k = 1'b1;
	 
    always @(posedge rst or posedge clk) begin
        if (rst)
				q[0] <= 0;
        else if ((j == 1'b1) && (k == 1'b1)) begin
            q[0] <= ~q[0];
        end
    end

    always @(posedge rst or posedge qn[0]) begin
        if (rst)
				q[1] <= 0;
        else if ((j == 1'b1) && (k == 1'b1)) begin
            q[1] <= ~q[1];
        end
    end
	 
	 always @(posedge rst or posedge qn[1]) begin
        if (rst)
				q[2] <= 0;
        else if ((j == 1'b1) && (k == 1'b1)) begin
            q[2] <= ~q[2];
        end
    end

endmodule
