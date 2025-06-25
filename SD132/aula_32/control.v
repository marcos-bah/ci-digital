module control #(parameter N = 4)(
	input clk, rst, ula_ack, wr_ack, ri_ack, pc_ack,
    input [1:0] mnm_in,
	output reg ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula;
);

reg [2:0] state;
parameter pc = 0, fetch = 1, ldr = 2, arit = 3, write_rd = 4, write_ro = 5, _logic = 6;

always @(posedge clk, posedge rst) begin
	if (rst) begin
    	state <= fetch;
    	{ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula} <= 7'b0000000;
	end else begin
    	case (state)
			pc: begin
                if (pc_ack) begin
                    state <= fetch;
                end else begin
                    state <= pc;
                end
            end

            fetch: begin
                if (mnm_in == 01  && ri_ack == 1) begin
                    state <= _logic;
                end else if ((mnm_in == 10 || mmm == 11) && ri_ack == 1) begin
                    state <= arit;
                end else  if (mnm_in == 00  && ri_ack == 1) begin
                    state <= ldr;
                end
            end

            ldr: begin
                if (wr_ack == 1) begin
                    state <= pc;
                end else begin
                    state <= ldr;
                end
            end

            arit: begin
                if (ula_ack == 1) begin
                    state <= write_rd;
                end else begin
                    state <= arit;
                end
            end

            write_rd: begin
                if (wr_ack == 1) begin
                    state <= pc;
                end else begin
                    state <= write_rd;
                end
            end

            _logic: begin
                if (ula_ack == 1) begin
                    state <= write_ro;
                end else begin
                    state <= _logic;
                end
            end

            write_ro: begin
                if (wr_ack == 1) begin
                    state <= pc;
                end else begin
                    state <= write_ro;
                end
            end

			default: begin
				state <= fetch;
			end
		endcase

	end
end

always @(*) begin
	case (state)
    	pc: begin
            {ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula} <= 7'b1000000;
        end
        fetch: begin
            {ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula} <= 7'b0100000;
        end
        ldr: begin
            {ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula} <= 7'b0011010;
        end
        arit: begin
            {ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula} <= 7'b0000101;
        end
        write_rd: begin
            {ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula} <= 7'b0011000;
        end
        _logic: begin
            {ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula} <= 7'b0000101;
        end
        write_ro: begin
            {ena_pc, ena_ri, ena_wr, sel_r0_rd, sel_addr_data, sel_ldr_ula, ena_ula} <= 7'b0010000;
        end
	endcase
end

endmodule