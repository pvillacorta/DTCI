module register (
	input [7:0] in,
	input load,
	output [7:0] out);

	always @(load) begin
		out = in;
	end
endmodule