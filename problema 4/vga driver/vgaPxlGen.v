module vgaPxlGen (clk, clk50, frame_pulse, rst, pxl_en, x, y, r, g, b);

	input clk;
	input rst;
	input pxl_en;
	input frame_pulse;
	input [9:0]  x;
	input [9:0] y;
	input clk50;
	
	output reg r;
	output reg g;
	output reg b;
	
	reg [9:0] p1X;
	reg [9:0] p1Y;
	
	
	
	reg [6:0] relY;
	wire [9:0] relX;
	
	barrasprite barrasprite (
		.address(relY),
		.clock(clk50),
		.q(relX)
	);
	
	// Deizando a tela vermelha
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			r <= 1'b0;
			g <= 1'b0;
			b <= 1'b0;
			p1X <= 10'd23;
			p1Y <= 10'd32;
			relY <= 7'd0;
		end else begin
			if (pxl_en) begin
				if(x >= p1X && x < p1X+10 && y >= p1Y && y < p1Y + 128)begin
					relY <= y - p1Y;
					r <= relX[9 - (x-p1X)];
					g <= relX[9 - (x-p1X)];
					b <= relX[9 - (x-p1X)];
				end else begin
					r <= 1'b0;
					b <= 1'b0;
					g <= 1'b0;
				end
			end else begin
				r <= 1'b0;
				g <= 1'b0;
				b <= 1'b0;
			end
		end
	end
	
endmodule