// Complementador de 9 bits. Hecho en estructual con XORs.
module complementer(output[8:0] o,
                    input [7:0] i,
                    input negate);

   xor xor1[8:0](o, {1'b0,i}, {negate, negate, negate, negate,
                        negate, negate, negate, negate, negate});
endmodule // complementer