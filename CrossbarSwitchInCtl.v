/*\

xbar_selectors[0] = 2'b11;
xbar_selectors[1] = 2'b10;
xbar_selectors[2] = 2'b00;
xbar_selectors[3] = 2'b01;


	  CHANNEL BUFFERS
M       O0 O1 O2 O3
O -> I0          ^^
D -> I1       ^^
C -> I2 ^^
T -> I3    ^^
L

\*/

// FIXME: hardcoded to 4x4 currently, should make it generic
module CrossbarSwitchInCtl #(parameter IO_WIDTH=1)
					   (clk_in,
					    xbar_selectors_a, xbar_selectors_b, xbar_selectors_c, xbar_selectors_d,
						outputs_a, outputs_b, outputs_c, outputs_d,
						inputs_a, inputs_b, inputs_c, inputs_d);
	
	input						clk_in;
	input	[1:0]				xbar_selectors_a;
	input	[1:0]				xbar_selectors_b;
	input	[1:0]				xbar_selectors_c;
	input	[1:0]				xbar_selectors_d;
	output	reg	[IO_WIDTH]		outputs_a;
	output	reg	[IO_WIDTH]		outputs_b;
	output	reg	[IO_WIDTH]		outputs_c;
	output	reg	[IO_WIDTH]		outputs_d;
	input	[IO_WIDTH]			inputs_a;
	input	[IO_WIDTH]			inputs_b;
	input	[IO_WIDTH]			inputs_c;
	input	[IO_WIDTH]			inputs_d;
	
	always @ (*) begin
		// select output_a's source
		if(xbar_selectors_a == 2'b00) begin
			outputs_a <= inputs_a;
		end else if(xbar_selectors_b == 2'b00) begin
			outputs_a <= inputs_b;
		end else if(xbar_selectors_c == 2'b00) begin
			outputs_a <= inputs_c;
		end else if(xbar_selectors_d == 2'b00) begin
			outputs_a <= inputs_d;
		end
		
		// select output_b's source
		if(xbar_selectors_a == 2'b01) begin
			outputs_b <= inputs_a;
		end else if(xbar_selectors_b == 2'b01) begin
			outputs_b <= inputs_b;
		end else if(xbar_selectors_c == 2'b01) begin
			outputs_b <= inputs_c;
		end else if(xbar_selectors_d == 2'b01) begin
			outputs_b <= inputs_d;
		end
		
		// select output_c's source
		if(xbar_selectors_a == 2'b10) begin
			outputs_c <= inputs_a;
		end else if(xbar_selectors_b == 2'b10) begin
			outputs_c <= inputs_b;
		end else if(xbar_selectors_c == 2'b10) begin
			outputs_c <= inputs_c;
		end else if(xbar_selectors_d == 2'b10) begin
			outputs_c <= inputs_d;
		end
		
		// select output_d's source
		if(xbar_selectors_a == 2'b11) begin
			outputs_d <= inputs_a;
		end else if(xbar_selectors_b == 2'b11) begin
			outputs_d <= inputs_b;
		end else if(xbar_selectors_c == 2'b11) begin
			outputs_d <= inputs_c;
		end else if(xbar_selectors_d == 2'b11) begin
			outputs_d <= inputs_d;
		end
	end
	
	/*
	Mux14 mux_a(xbar_selectors_a, inputs_a, outputs_a, outputs_b, outputs_c, outputs_d);
	Mux14 mux_b(xbar_selectors_b, inputs_b, outputs_a, outputs_b, outputs_c, outputs_d);
	Mux14 mux_c(xbar_selectors_c, inputs_b, outputs_a, outputs_b, outputs_c, outputs_d);
	Mux14 mux_d(xbar_selectors_d, inputs_d, outputs_a, outputs_b, outputs_c, outputs_d);
	*/
endmodule