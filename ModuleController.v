module ModuleController(
	clk_in, location, chanbuf_xbar, 
	tx_buffer, rx_buffer, rx_ready, rx_ready_ack, spi_deselected,
	chanbuf_clken, chanbuf_addr, chanbuf_data_w, chanbuf_data_r, chanbuf_we
);
	input				clk_in;
	input		[7:0]	location;
	output	reg	[1:0]	chanbuf_xbar;
	
	output	reg	[7:0]	tx_buffer;
	input		[7:0]	rx_buffer;
	input				rx_ready;
	output	reg			rx_ready_ack;
	input				spi_deselected;
	
	output	reg			chanbuf_clken;
	output	reg	[8:0]	chanbuf_addr;
	output  reg	[7:0]	chanbuf_data_w;
	input   	[7:0]	chanbuf_data_r;
	output  reg			chanbuf_we;
	
	reg	[1:0]	cmd_arg_data;
	reg [7:0]	cmd;
	reg [1:0]	arg_nbr;
	reg [2:0]	chanbuf_selected;
	
	reg	[8:0]	addr_pointer;
	reg			chanbuf_clken_req;	// request to toggle chanbuf_clken on next clock cycle
	reg			read_pending;		// reading from RAM on the next clock cycle
	reg			read_ready;			// data ready to put into the tx_buffer on next clock cycle
	
	`define PROTO_VERSION	8'd1
	`define FW_VERSION_HIGH	8'd2
	`define FW_VERSION_LOW  8'd3	
	`define HW_VERSION		8'd4	// TODO: figure out how best to implement this
	
	`define	CMD_NOOP		8'b00000000
	`define CMD_WRITE		8'b00000010
	`define CMD_READ		8'b00000011
	`define CMD_READNEXT	8'b00000100
	`define CMD_GETLOC		8'b00000110
	`define CMD_SETPTR		8'b00000111
	`define CMD_GETVER		8'b00001000
	`define CMD_TAKEOVER	8'b00001001
	
	`define CAD_CMD		2'b00
	`define CAD_ARG		2'b01
	`define CAD_DATA	2'b10
	
	initial begin
		cmd_arg_data		<= 2'b00;
		cmd					<= 8'b00000000;
		arg_nbr				<= 2'b00;
		addr_pointer		<= 9'b000000000;
		chanbuf_clken_req	<= 1'b0;
		rx_ready_ack		<= 1'b0;
		tx_buffer			<= 8'b00000000;
		read_pending		<= 1'b0;
		read_ready			<= 1'b0;
		chanbuf_xbar		<= 2'b00;
		chanbuf_selected	<= 3'b000;
	end
	
	always @ (negedge clk_in) begin
		if(chanbuf_clken_req == 1'b1) begin
			chanbuf_clken	<= 1'b1;
			if(chanbuf_we == 1'b0) begin
				read_pending	<= 1'b1;
			end
		end else begin
			chanbuf_clken   <= 1'b0;
		end
		if(read_ready == 1'b1) begin
			read_ready <= 1'b0;
		end
		if(read_pending == 1'b1) begin
			read_ready	 <= 1'b1;
			read_pending <= 1'b0;
		end
	end
	
	always @ (posedge clk_in) begin
		// only look at adjusting the chanbuf crossbar if there's no operation in progress
		if(!chanbuf_clken_req && !read_pending && !read_ready) begin
			// if the channel buffer we need to talk to has changed, change the crossbar
			// chanbuf_selected of 0 means "native channel", so get it from the location
			if(chanbuf_selected == 3'b000) begin
				chanbuf_selected <= location[3:1];
				chanbuf_xbar	 <= location[3:1] - 1'b1;
			end else if(chanbuf_selected - 1'b1 != chanbuf_xbar) begin
				chanbuf_xbar	 <= chanbuf_selected - 1'b1;
			end
		end
		if(spi_deselected == 1'b1 && rx_ready == 1'b0) begin
			// if we're not selected and there is no data waiting, reset us back to 'waiting for cmd'
			cmd_arg_data <= `CAD_CMD;
		end		
		if(chanbuf_clken_req == 1'b1) begin
			chanbuf_clken_req <= 1'b0;
		end
		if(read_ready == 1'b1) begin
			tx_buffer <= chanbuf_data_r;
		end
		if(rx_ready == 1'b1 && rx_ready_ack == 1'b0) begin
			// there's a byte of data ready for us
			if(cmd_arg_data == `CAD_CMD) begin
				// this is a command
				cmd			 <= rx_buffer;
				case(rx_buffer)
					`CMD_READNEXT: begin
						// READNEXT command, no arguments
						// acts the same as READ, but uses the last pointer rather than explicitly setting it
						cmd			 <= `CMD_NOOP;
						cmd_arg_data <= `CAD_DATA;
						// get the first read ready now
						chanbuf_addr		<= addr_pointer;
						addr_pointer		<= addr_pointer + 1;
						chanbuf_we   		<= 1'b0;
						chanbuf_clken_req	<= 1'b1;
					end
					`CMD_GETLOC: begin
						// GETLOC command, no arguments
						cmd_arg_data <= `CAD_DATA;
						tx_buffer    <= location;
					end
					`CMD_GETVER: begin
						// GETVER command, no arguments
						cmd_arg_data <= `CAD_DATA;
						addr_pointer <= 1'b0;
						tx_buffer    <= `PROTO_VERSION;
					end
					default: begin
						// all other commands take at least one argument
						cmd_arg_data <= `CAD_ARG;
						arg_nbr		 <= 1'b0;
					end
				endcase
			end else if(cmd_arg_data == `CAD_ARG) begin
				case(cmd)
					`CMD_WRITE: begin
						// WRITE command, only argument is the starting address
						if(location[0] == 0) begin
							// it's an input module, allow the write to continue
							addr_pointer <= rx_buffer;
							cmd_arg_data <= `CAD_DATA;
						end else begin
							// it's an output module, writes are not permitted
							// so turn this into a NOOP instead
							cmd <= `CMD_NOOP;
						end
					end
					`CMD_READ: begin
						// READ command, only argument is the starting address
						addr_pointer <= rx_buffer + 1;
						cmd_arg_data <= `CAD_DATA;
						// get the first read ready now
						chanbuf_addr		<= rx_buffer;
						chanbuf_we   		<= 1'b0;
						chanbuf_clken_req	<= 1'b1;
					end
					`CMD_SETPTR: begin
						// SETPTR command, only argument is the new pointer address
						addr_pointer <= rx_buffer;
					end
					`CMD_TAKEOVER: begin
						// TAKEOVER command, only argument is the new channel buffer to talk to
						chanbuf_selected <= rx_buffer;
					end
				endcase
			end else if(cmd_arg_data == `CAD_DATA) begin
				case(cmd)
					`CMD_WRITE: begin
						chanbuf_addr		<= addr_pointer;
						chanbuf_data_w		<= rx_buffer;
						chanbuf_clken_req	<= 1'b1;
						chanbuf_we   		<= 1'b1;
						addr_pointer		<= addr_pointer + 1'b1;
					end
					`CMD_READ: begin
						addr_pointer		<= addr_pointer + 1'b1;
						chanbuf_addr		<= addr_pointer;
						chanbuf_we   		<= 1'b0;
						chanbuf_clken_req	<= 1'b1;
					end
					`CMD_GETLOC: begin
						tx_buffer			<= location;
					end
					`CMD_GETVER: begin
						case(addr_pointer)
							0:			tx_buffer <= `FW_VERSION_HIGH;
							1:			tx_buffer <= `FW_VERSION_LOW;
							2:			tx_buffer <= `HW_VERSION;
							default:	tx_buffer <= 8'b11111111;
						endcase
						addr_pointer <= addr_pointer + 1;
					end
				endcase
			end
			rx_ready_ack <= 1'b1;
		end else if(rx_ready == 1'b0 && rx_ready_ack == 1'b1) begin 
			// rx_ready lowered, lower ack
			rx_ready_ack <= 1'b0;
		end
	end
endmodule
