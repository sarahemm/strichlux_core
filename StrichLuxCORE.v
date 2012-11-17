module StrichLuxCORE(
	outmod_spi_sclk, outmod_spi_mosi, outmod_spi_miso, outmod_spi_n_ss, outmod_i2c_scl, outmod_i2c_sda,
	inmod_spi_sclk,  inmod_spi_mosi,  inmod_spi_miso,  inmod_spi_n_ss, inmod_i2c_scl, inmod_i2c_sda,
	pwrmod_scl, pwrmod_sda, pwrmod_vhpa_en, pwrmod_vhpb_en,
	rs232_tx, rs232_rx, rs232_valid, rs232_usb_tx, rs232_usb_rx, rs232_usb_valid, rs232_usb_rts, rs232_usb_cts,
	ledctl_scl, ledctl_sda, status_warning, status_fault,
	expansion, debug_a, debug_b);
	
	input	[4:1]	outmod_spi_sclk;
	input	[4:1]	outmod_spi_mosi;
	output	[4:1]	outmod_spi_miso;
	input	[4:1]	outmod_spi_n_ss;
	wire	[4:1]	outmod_spi_deselected;
	inout	[4:1]	outmod_i2c_scl;
	inout	[4:1]	outmod_i2c_sda;
	
	input	[4:1]	inmod_spi_sclk;
	input	[4:1]	inmod_spi_mosi;
	output	[4:1]	inmod_spi_miso;
	input	[4:1]	inmod_spi_n_ss;
	wire	[4:1]	inmod_spi_deselected;
	inout	[4:1]	inmod_i2c_scl;
	inout	[4:1]	inmod_i2c_sda;
	
	inout			pwrmod_scl;
	inout			pwrmod_sda;
	output			pwrmod_vhpa_en;
	output			pwrmod_vhpb_en;
	
	output			rs232_tx;
	input			rs232_rx;
	input			rs232_valid;
	output			rs232_usb_tx;
	input			rs232_usb_rx;
	input			rs232_usb_valid;
	input			rs232_usb_rts;
	output			rs232_usb_cts;
	
	inout			ledctl_scl;
	inout			ledctl_sda;
	output			status_warning;
	output			status_fault;
	
	output	[5:0]	expansion;
	output	[7:0]	debug_a;
	output	[7:0]	debug_b;
	
	wire			master_clk;
	
	wire	[7:0]	outmod_tx_buffer [4:1];
	wire	[7:0]	outmod_rx_buffer [4:1];
	wire	[4:1]	outmod_rx_ready;
	wire	[4:1]	outmod_rx_ready_ack;
	
	wire	[7:0]	inmod_tx_buffer [4:1];
	wire	[7:0]	inmod_rx_buffer [4:1];
	wire	[4:1]	inmod_rx_ready;
	wire	[4:1]	inmod_rx_ready_ack;
	
	wire	[8:0]	chanbuf_i_addr   	  [4:1];
	wire	[8:0]	chanbuf_i_addr_mods   [4:1];
	wire	[8:0]	chanbuf_o_addr   	  [4:1];
	wire	[7:0]	chanbuf_i_data_i 	  [4:1];
	wire	[7:0]	chanbuf_i_data_i_mods [4:1];
	wire	[7:0]	chanbuf_o_data_i 	  [4:1];
	wire	[7:0]	chanbuf_i_data_o 	  [4:1];
	wire	[7:0]	chanbuf_i_data_o_mods [4:1];
	wire	[7:0]	chanbuf_o_data_o 	  [4:1];
	wire	[4:1]	chanbuf_i_clken;
	wire	[4:1]	chanbuf_i_clken_mods;
	wire	[4:1]	chanbuf_o_clken;
	wire	[4:1]	chanbuf_i_we;
	wire	[4:1]	chanbuf_i_we_mods;
	wire	[4:1]	chanbuf_o_we;
	wire	[4:1]	chanbuf_i_reset;
	wire	[4:1]	chanbuf_o_reset;
	
	wire	[1:0]	inxbar_selectors	  [4:1];
	wire	[1:0]	outxbar_selectors	  [4:1];
	
	`define	MASTER_CLK_MHZ	"40.0"
	
	GSR GSR_INST(.GSR(1'b1));
	PUR PUR_INST(.PUR(1'b1));
	OSCE #(`MASTER_CLK_MHZ) osc(.OSC(master_clk));
	
	// for now all power busses are always enabled and LEDs are fixed
	assign pwrmod_vhpa_en = 1'b1;
	assign pwrmod_vhpb_en = 1'b1;
	assign status_warning = 1'b1;
	assign status_fault   = 1'b1;
	
	// these are for possible future use in troubleshooting/debugging
	assign debug_a = inxbar_selectors[1];
	//assign debug_b[0] = inmod_rx_ready[1];
	//assign debug_b[1] = inmod_rx_ready_ack[1];
	//assign debug_b[2] = inmod_spi_n_ss[1];
	//assign debug_b[3] = inmod_spi_deselected[1];
//	assign debug_a		  = 8'b00000000;
//	assign debug_b		  = 8'b00000000;
	wire [7:0] junk; // temp
	
	// for use in a future expansion
	assign expansion	  = 5'b00000;
	
	// crossbar switches to arbitrate access to the input side of the framebuffers
	CrossbarSwitchInCtl #(1)  inxbar_clken(master_clk,
		inxbar_selectors[1], inxbar_selectors[2], inxbar_selectors[3], inxbar_selectors[4],
		chanbuf_i_clken[1], chanbuf_i_clken[2], chanbuf_i_clken[3], chanbuf_i_clken[4],
		chanbuf_i_clken_mods[1], chanbuf_i_clken_mods[2], chanbuf_i_clken_mods[3], chanbuf_i_clken_mods[4]
	);
	CrossbarSwitchInCtl #(9)  inxbar_addr(master_clk,
		inxbar_selectors[1], inxbar_selectors[2], inxbar_selectors[3], inxbar_selectors[4],
		chanbuf_i_addr[1], chanbuf_i_addr[2], chanbuf_i_addr[3], chanbuf_i_addr[4],
		chanbuf_i_addr_mods[1], chanbuf_i_addr_mods[2], chanbuf_i_addr_mods[3], chanbuf_i_addr_mods[4]
	);
	CrossbarSwitchInCtl #(8)  inxbar_data_i(master_clk,
		inxbar_selectors[1], inxbar_selectors[2], inxbar_selectors[3], inxbar_selectors[4],
		chanbuf_i_data_i[1], chanbuf_i_data_i[2], chanbuf_i_data_i[3], chanbuf_i_data_i[4],
		chanbuf_i_data_i_mods[1], chanbuf_i_data_i_mods[2], chanbuf_i_data_i_mods[3], chanbuf_i_data_i_mods[4]
	);
	CrossbarSwitchOutCtl #(8) inxbar_data_o(master_clk,
		inxbar_selectors[1], inxbar_selectors[2], inxbar_selectors[3], inxbar_selectors[4],
		chanbuf_i_data_o[1], chanbuf_i_data_o[2], chanbuf_i_data_o[3], chanbuf_i_data_o[4],
		chanbuf_i_data_o_mods[1], chanbuf_i_data_o_mods[2], chanbuf_i_data_o_mods[3], chanbuf_i_data_o_mods[4]
	);
	CrossbarSwitchInCtl #(1)  inxbar_we(master_clk,
		inxbar_selectors[1], inxbar_selectors[2], inxbar_selectors[3], inxbar_selectors[4],
		chanbuf_i_we[1], chanbuf_i_we[2], chanbuf_i_we[3], chanbuf_i_we[4],
		chanbuf_i_we_mods[1], chanbuf_i_we_mods[2], chanbuf_i_we_mods[3], chanbuf_i_we_mods[4]
	);

	// output module 1
	SPISlaveInterface		outintf_1(
		master_clk,
		outmod_spi_sclk[1], outmod_spi_mosi[1], outmod_spi_miso[1], outmod_spi_n_ss[1],
		outmod_tx_buffer[1], outmod_rx_buffer[1], outmod_rx_ready[1], outmod_rx_ready_ack[1],
		outmod_spi_deselected[1]
	);
	ModuleController	outctl_1 (
		master_clk, 8'b00000011, outxbar_selectors[1],
		outmod_tx_buffer[1], outmod_rx_buffer[1], outmod_rx_ready[1], outmod_rx_ready_ack[1], outmod_spi_deselected[1],
		chanbuf_o_clken[1],  chanbuf_o_addr[1],  chanbuf_o_data_i[1],
		chanbuf_o_data_o[1], chanbuf_o_we[1]
	);

	// output module 2
	SPISlaveInterface		outintf_2(
		master_clk,
		outmod_spi_sclk[2], outmod_spi_mosi[2], outmod_spi_miso[2], outmod_spi_n_ss[2],
		outmod_tx_buffer[2], outmod_rx_buffer[2], outmod_rx_ready[2], outmod_rx_ready_ack[2],
		outmod_spi_deselected[2]
	);
	ModuleController	outctl_2 (
		master_clk, 8'b00000101, outxbar_selectors[2],
		outmod_tx_buffer[2], outmod_rx_buffer[2], outmod_rx_ready[2], outmod_rx_ready_ack[2], outmod_spi_deselected[2],
		chanbuf_o_clken[2],  chanbuf_o_addr[2],  chanbuf_o_data_i[2],
		chanbuf_o_data_o[2], chanbuf_o_we[2]
	);
	// output module 3
	SPISlaveInterface		outintf_3(
		master_clk,
		outmod_spi_sclk[3], outmod_spi_mosi[3], outmod_spi_miso[3], outmod_spi_n_ss[3],
		outmod_tx_buffer[3], outmod_rx_buffer[3], outmod_rx_ready[3], outmod_rx_ready_ack[3],
		outmod_spi_deselected[3]
	);
	ModuleController	outctl_3 (
		master_clk, 8'b00000111, outxbar_selectors[3],
		outmod_tx_buffer[3], outmod_rx_buffer[3], outmod_rx_ready[3], outmod_rx_ready_ack[3], outmod_spi_deselected[3],
		chanbuf_o_clken[3],  chanbuf_o_addr[3],  chanbuf_o_data_i[3],
		chanbuf_o_data_o[3], chanbuf_o_we[3]
	);
	
	// output module 4
	SPISlaveInterface		outintf_4(
		master_clk,
		outmod_spi_sclk[4], outmod_spi_mosi[4], outmod_spi_miso[4], outmod_spi_n_ss[4],
		outmod_tx_buffer[4], outmod_rx_buffer[4], outmod_rx_ready[4], outmod_rx_ready_ack[4],
		outmod_spi_deselected[4]
	);
	ModuleController	outctl_4 (
		master_clk, 8'b00001001, outxbar_selectors[4],
		outmod_tx_buffer[4], outmod_rx_buffer[4], outmod_rx_ready[4], outmod_rx_ready_ack[4], outmod_spi_deselected[4],
		chanbuf_o_clken[4],  chanbuf_o_addr[4],  chanbuf_o_data_i[4],
		chanbuf_o_data_o[4], chanbuf_o_we[4]
	);
	
	// channel buffer 1
	ChannelBuffer1 chanbuf_1 (
		chanbuf_i_data_i[1], chanbuf_o_data_i[1],
		chanbuf_i_addr[1], chanbuf_o_addr[1],
		master_clk, master_clk,
		chanbuf_i_clken[1], chanbuf_o_clken[1],
		chanbuf_i_we[1], chanbuf_o_we[1],
		chanbuf_i_reset[1], chanbuf_o_reset[1],
		chanbuf_i_data_o[1], chanbuf_o_data_o[1]
	);

	// channel buffer 2
	ChannelBuffer1 chanbuf_2 (
		chanbuf_i_data_i[2], chanbuf_o_data_i[2],
		chanbuf_i_addr[2], chanbuf_o_addr[2],
		master_clk, master_clk,
		chanbuf_i_clken[2], chanbuf_o_clken[2],
		chanbuf_i_we[2], chanbuf_o_we[2],
		chanbuf_i_reset[2], chanbuf_o_reset[2],
		chanbuf_i_data_o[2], chanbuf_o_data_o[2]
	);
	
	// channel buffer 3
	ChannelBuffer1 chanbuf_3 (
		chanbuf_i_data_i[3], chanbuf_o_data_i[3],
		chanbuf_i_addr[3], chanbuf_o_addr[3],
		master_clk, master_clk,
		chanbuf_i_clken[3], chanbuf_o_clken[3],
		chanbuf_i_we[3], chanbuf_o_we[3],
		chanbuf_i_reset[3], chanbuf_o_reset[3],
		chanbuf_i_data_o[3], chanbuf_o_data_o[3]
	);
	
	// channel buffer 4
	ChannelBuffer1 chanbuf_4 (
		chanbuf_i_data_i[4], chanbuf_o_data_i[4],
		chanbuf_i_addr[4], chanbuf_o_addr[4],
		master_clk, master_clk,
		chanbuf_i_clken[4], chanbuf_o_clken[4],
		chanbuf_i_we[4], chanbuf_o_we[4],
		chanbuf_i_reset[4], chanbuf_o_reset[4],
		chanbuf_i_data_o[4], chanbuf_o_data_o[4]
	);
	
	// input module 1
	SPISlaveInterface	inintf_1(
		master_clk,
		inmod_spi_sclk[1],  inmod_spi_mosi[1],  inmod_spi_miso[1], inmod_spi_n_ss[1],
		inmod_tx_buffer[1], inmod_rx_buffer[1], inmod_rx_ready[1], inmod_rx_ready_ack[1],
		inmod_spi_deselected[1]
	);
	ModuleController	inctl_1 (
		master_clk, 8'b00000010, inxbar_selectors[1],
		inmod_tx_buffer[1],  inmod_rx_buffer[1], inmod_rx_ready[1], inmod_rx_ready_ack[1], inmod_spi_deselected[1],
		chanbuf_i_clken_mods[1], chanbuf_i_addr_mods[1], chanbuf_i_data_i_mods[1], chanbuf_i_data_o_mods[1], chanbuf_i_we_mods[1]
	);
	
	// input module 2
	SPISlaveInterface	inintf_2(
		master_clk,
		inmod_spi_sclk[2],  inmod_spi_mosi[2],  inmod_spi_miso[2], inmod_spi_n_ss[2],
		inmod_tx_buffer[2], inmod_rx_buffer[2], inmod_rx_ready[2], inmod_rx_ready_ack[2],
		inmod_spi_deselected[2]
	);
	ModuleController	inctl_2(
		master_clk, 8'b00000100, inxbar_selectors[2],
		inmod_tx_buffer[2],  inmod_rx_buffer[2], inmod_rx_ready[2], inmod_rx_ready_ack[2], inmod_spi_deselected[2],
		chanbuf_i_clken_mods[2], chanbuf_i_addr_mods[2], chanbuf_i_data_i_mods[2], chanbuf_i_data_o_mods[2], chanbuf_i_we_mods[2]
	);
	
	// input module 3
	SPISlaveInterface	inintf_3(
		master_clk,
		inmod_spi_sclk[3],  inmod_spi_mosi[3],  inmod_spi_miso[3], inmod_spi_n_ss[3],
		inmod_tx_buffer[3], inmod_rx_buffer[3], inmod_rx_ready[3], inmod_rx_ready_ack[3],
		inmod_spi_deselected[3]
	);
	ModuleController	inctl_3(
		master_clk, 8'b00000110, inxbar_selectors[3],
		inmod_tx_buffer[3],  inmod_rx_buffer[3], inmod_rx_ready[3], inmod_rx_ready_ack[3], inmod_spi_deselected[3],
		chanbuf_i_clken_mods[3], chanbuf_i_addr_mods[3], chanbuf_i_data_i_mods[3], chanbuf_i_data_o_mods[3], chanbuf_i_we_mods[3]
	);
	
	// input module 4
	SPISlaveInterface	inintf_4(
		master_clk,
		inmod_spi_sclk[4],  inmod_spi_mosi[4],  inmod_spi_miso[4], inmod_spi_n_ss[4],
		inmod_tx_buffer[4], inmod_rx_buffer[4], inmod_rx_ready[4], inmod_rx_ready_ack[4],
		inmod_spi_deselected[4]
	);
	ModuleController	inctl_4(
		master_clk, 8'b00001000, inxbar_selectors[4],
		inmod_tx_buffer[4],  inmod_rx_buffer[4], inmod_rx_ready[4], inmod_rx_ready_ack[4], inmod_spi_deselected[4],
		chanbuf_i_clken_mods[4], chanbuf_i_addr_mods[4], chanbuf_i_data_i_mods[4], chanbuf_i_data_o_mods[4], chanbuf_i_we_mods[4]
	);
endmodule
	