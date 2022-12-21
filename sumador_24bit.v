module sumador24bit(
	output [23:0] suma,
	output cout,
	input [23:0] a,b,
	input cin);
	
	assign {cout,suma} = a +  b + cin;
	
endmodule

