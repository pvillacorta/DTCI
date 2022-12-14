
module comparador(output salida,input [7:0] entrada);

	assign salida = (entrada < 24) ? 0 : 1;

endmodule

	