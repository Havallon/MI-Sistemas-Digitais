module random (clk, rst, out);

	input clk;
	input rst;
	
	output [1:0] out;
	
	reg [3:0] counter;
	
	always @ (posedge clk or negedge rst) begin
		if (!rst) begin
			counter <= 4'd0;
		end else begin
			counter <= counter + 4'd1;
		end
	end
	
	xnor(out[0], counter[3], counter[1]);
	xnor(out[1], counter[2], counter[0]);
	
endmodule