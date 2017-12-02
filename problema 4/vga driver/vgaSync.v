module vgaSync(clk, rst, hsync, vsync, hpos, vpos, pxl_en);

	input clk;
	input rst;
	
	output reg hsync;
	output reg vsync;
	
	output reg [10:0] hpos;
	output reg [9:0]  vpos;
	
	output reg pxl_en;
	
	localparam hva = 800;
	localparam hfp = 56;
	localparam hsp = 120;
	localparam hbp = 64;
	
	localparam vva = 600;
	localparam vfp = 37;
	localparam vsp = 6;
	localparam vbp = 23;
	
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			hpos   <= 11'd0;
			vpos   <= 10'd0;
		end else begin
			if (hpos < (hva + hfp + hsp + hbp)) begin
				hpos <= hpos + 11'd1;
			end else begin
				hpos <= 11'd0;
				if (vpos < (vva + vfp + vsp + vbp)) begin
					vpos <= vpos + 10'd1;
				end else begin
					vpos <= 10'd0;
				end
			end
		end
	end
	
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			hsync  <= 1'b0;
			vsync  <= 1'b0;
		end else begin
			if ((hpos > (hva + hfp)) && (hpos <(hva + hfp +hsp))) begin
				hsync <= 1'b0;
			end else begin
				hsync <= 1'b1;
			end
			
			if ((vpos > (vva + vfp)) && (vpos < (vva + vfp +vsp))) begin
				vsync <= 1'b0;
			end else begin
				vsync <= 1'b1;
			end
		end
	end
	
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			pxl_en <= 1'b0;
		end else begin
			if (hpos > hva || vpos > vva) begin
				pxl_en <= 1'b0;
			end else begin
				pxl_en <= 1'b1;
			end
		end
	end
	
endmodule