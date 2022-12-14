
module sumador9bit(
	output [7:0] suma,
	output cout,
	output sign,
	input [8:0] a,b,
	input cin);
	
	assign {cout,sign,suma} = {a[8], a} + {b[8], b} + {9'b0,cin};
	
endmodule

