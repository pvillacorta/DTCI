// Complementador de 9 bits. Hecho en estructual con XORs.
module COMPLEMENTER(output[8:0] o,
                    input [8:0] i,
                    input negate);

   xor xor1[8:0](o, i, {negate, negate, negate, negate,
                        negate, negate, negate, negate, negate});
endmodule // COMPLEMENTER
