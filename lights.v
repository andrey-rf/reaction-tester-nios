module lights(CLOCK_50, number, control, LEDR, LEDG);
	input CLOCK_50;
	input [4:0]number;
	input control;
	output [17:0]LEDR;
	output [8:0]LEDG;
	
	wire [7:0] SW;
	wire [2:0] KEY;
	
	virtual_input V1 (.number(number), .control(control), .button0(KEY[0]), .button1(KEY[1]), .button2(KEY[2]),
	.switch0(SW[0]), .switch1(SW[1]), .switch2(SW[2]), .switch3(SW[3]), .switch4(SW[4]), .switch5(SW[5]), .switch6(SW[6]), .switch7(SW[7]));
	
	nios_system NIOSII(
		.clk_clk(CLOCK_50),         //      clk.clk
		.ledr_export(LEDR),     //     ledr.export
		.ledg_export(LEDG),
		.reset_reset_n(~reset),   //    reset.reset_n
		.key_export(KEY),
		.switch_export(SW)
		);
		
endmodule