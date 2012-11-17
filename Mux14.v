module Mux14 #(parameter IO_WIDTH=8)
              (select, in, out_a, out_b, out_c, out_d);
			  
	input		[1:0]			select;
	input		[IO_WIDTH-1:0]	in;
	output	reg [IO_WIDTH-1:0]  out_a;
	output	reg [IO_WIDTH-1:0]  out_b;
	output	reg [IO_WIDTH-1:0]  out_c;
	output	reg [IO_WIDTH-1:0]  out_d;

	always @ (*) begin
		case(select)
			2'b00: begin
				out_a <= in;
				out_b <= 8'bZZZZZZZZ;
				out_c <= 8'bZZZZZZZZ;
				out_d <= 8'bZZZZZZZZ;
			end
			2'b01: begin
				out_a <= 8'bZZZZZZZZ;
				out_b <= in;
				out_c <= 1'bZZZZZZZZ;
				out_d <= 8'bZZZZZZZZ;
			end
			2'b10: begin
				out_a <= 8'bZZZZZZZZ;
				out_b <= 8'bZZZZZZZZ;
				out_c <= in;
				out_d <= 8'bZZZZZZZZ;
			end
			2'b11: begin
				out_a <= 8'bZZZZZZZZ;
				out_b <= 8'bZZZZZZZZ;
				out_c <= 8'bZZZZZZZZ;
				out_d <= in;
			end
		endcase
	end
endmodule