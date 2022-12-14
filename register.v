module register (
	input [7:0] in,
	input load, clk,
	output [7:0] out);

	always @(posedge clk and load) begin
		out = in;
	end
endmodule