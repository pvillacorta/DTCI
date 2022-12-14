// Multiplexer. N -> Numero de bits de I/O del mux.
module MUX #(parameter N=8)
           (output[N-1:0] o,
           input [N-1:0] i0,
           input [N-1:0] i1,
           input sel);
   assign o = sel ? i1 : i0;
endmodule // MUX