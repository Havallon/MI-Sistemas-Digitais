//VGA DRIVER
// Crystal & Havallon
// 02/12/2017
module vgaDriver(clock_50MHz, KEY, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, x1, y1, x2, y2, xb, yb);
	
	input clock_50MHz;
	input [11:0] KEY;
	
	input [9:0] x1;
	input [9:0] y1;
	
	input [9:0] x2;
	input [9:0] y2;
	
	input [9:0] xb;
	input [9:0] yb;
	
	output VGA_HS;
	output VGA_VS;
	output [3:0] VGA_R;
	output [3:0] VGA_G;
	output [3:0] VGA_B;
	
	wire [9:0] x;
	wire [9:0] y;
	wire en;
	
	wire rr;
	wire gg;
	wire bb;
	
	wire frame_pulse;
	
	wire clk25;
	
	assign VGA_VS = frame_pulse;
	assign VGA_R = {rr,rr,rr,rr};
	assign VGA_G = {gg,gg,gg,gg};
	assign VGA_B = {bb,bb,bb,bb};
	
	clk50to25 clk50to25 (
		.rst(KEY[0]),
		.clk_in(clock_50MHz),
		.clk_out(clk25)
	);
	
	vgaSync vgaSync(
		.clk(clk25),
		.rst(KEY[0]),
		.hsync(VGA_HS),
		.vsync(frame_pulse),
		.hpos(x),
		.vpos(y),
		.pxl_en(en)
	);
	
	vgaPxlGen vgaPxlGen (
		.clk(clk25),
		.frame_pulse(~frame_pulse),
		.clk50(clock_50MHz),
		.rst(KEY[0]),
		.pxl_en(en),
		.x(x),
		.y(y),
		.r(rr),
		.g(gg),
		.b(bb),
		.x1(x1),
		.y1(y1),
		.x2(x2),
		.y2(y2),
		.xb(xb),
		.yb(yb)
	);
	
endmodule