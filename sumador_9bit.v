
module sumador9bit(
	output [8:0] suma,
	output cout,
	output sign,
	input [8:0] a,b,
	input cin);
	
	assign {cout,suma} = {a[8], a} + {b[8], b} + {9'b0,cin};
	assign sign = suma[8];
	
endmodule

