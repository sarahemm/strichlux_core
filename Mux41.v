module MuxN1 #(parameter IO_WIDTH=8, SELECT_WIDTH=2, NBR_INPUTS=4)
              (select, ins, out);

	input [SELECT_WIDTH-1:0]	select;
	input [IO_WIDTH-1:0]		ins [NBR_INPUTS-1:0];
	output     out;
	
	//wire      q;
	//wire[1:0] select;
	//wire[3:0] d;
	
	assign out = ins[select];
endmodule