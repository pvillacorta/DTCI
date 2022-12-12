module sumador24bit(
	output [23:0] suma,
	output cout,
	output sign,
	input [23:0] a,b,
	input cin);
	
	assign {cout,suma} = {a[23], a} + {b[23], b} + {23'b0,cin};
	assign sign = suma[23];
	
endmodule

