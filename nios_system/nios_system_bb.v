
module nios_system (
	clk_clk,
	key_export,
	ledg_export,
	ledr_export,
	reset_reset_n,
	switch_export);	

	input		clk_clk;
	input	[2:0]	key_export;
	output	[8:0]	ledg_export;
	output	[17:0]	ledr_export;
	input		reset_reset_n;
	output	[7:0]	switch_export;
endmodule
