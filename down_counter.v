module down_counter(entrada, load, countDown, clk, zero, Ediff); //Cuenta hacia abajo.

// Entradas
input[7:0] entrada; 
input load, countDown, clk; // Bit de carga, 

// Salidas
output zero; // Se pone a 1 cuando el contador llega a zero.

// Registros
output reg [7:0] Ediff; // Es la salida en cada momento

// Código

  always @(posedge clk) begin
	 
	 if(load == 1'b1)
		Ediff <= entrada;
    
    if (countDown) begin
       Ediff <= Ediff - 1;
    end
    
  end 
  
  assign zero = (Ediff == 8'b00000000) ? 1'b1 : 1'b0;
   
endmodule
