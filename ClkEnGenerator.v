module ClkEnGenerator(fast_clk_in, slow_clk_in, clk_out, already_got_it);
	input	fast_clk_in;
	input	slow_clk_in;
	output	reg	clk_out;
	
	output reg		already_got_it;
	
	initial begin
		already_got_it <= 1'b0;
	end
	
	always @ (posedge fast_clk_in) begin
		if(slow_clk_in == 1'b1 && !already_got_it) begin
			clk_out		   <= 1'b1;
			already_got_it <= 1'b1;
		end else begin
			clk_out 	   <= 1'b0;
		end
		if(slow_clk_in == 1'b0 && already_got_it) begin
			already_got_it <= 1'b0;
		end
	end
endmodule