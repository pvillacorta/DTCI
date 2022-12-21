
module sumador9bit(
	output [7:0] suma,
	output cout,
	output sign,
	input [8:0] a,b,
	input cin);
	
	assign {cout,sign,suma} = a + b + cin;
	
endmodule

