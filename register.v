module register (
	input [7:0] in,
	input load, clk,
	output reg [7:0] out);

	always @(posedge clk) 
	begin
		if(load)
			out <= in;
	end
endmodule