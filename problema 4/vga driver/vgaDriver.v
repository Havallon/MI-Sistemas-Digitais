module vgaDriver(clk, rst, hsync, vsync, r, g, b);
	
	input clk;
	input rst;
	
	output hsync;
	output vsync;
	output [3:0] r;
	output [3:0] g;
	output [3:0] b;
	
	wire [9:0] x;
	wire [10:0]  y;
	wire en;
	
	wire rb;
	wire gb;
	wire bb;
	
	vgaSync vgaSync(
		.clk(clk),
		.rst(rst),
		.hsync(hsync),
		.vsync(vsync),
		.hpos(y),
		.vpos(x),
		.pxl_en(en)
	);
	
	vgaPxlGen (
		.clk(clk),
		.rst(rst),
		.pxl_en(en),
		.x(x),
		.y(y),
		.r(rb),
		.g(gb),
		.b(bb)
	);
	
	assign r = {rb,rb,rb,rb};
	assign g = {gb,gb,gb,gb};
	assign b = {bb,bb,bb,bb};
	
endmodule