module upCounter(entrada, load, countUp, clk, REz); //Cuenta hacia arriba.

// Entradas
input[7:0] entrada; 
input load, countUp, clk; // Bit de carga, de suma y señal de reloj.

// Registros
output reg [7:0] REz; // Es la salida.

// Código
always @(posedge clk) begin
    REz <= (load == 1'b1) ? entrada : REz;
 
    if (countUp) begin
        REz <= REz + 1;
    end

end

endmodule