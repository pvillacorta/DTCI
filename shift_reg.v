////////////////////////////////////////////////////////////////
//
//	Módulo del registro desplazador con carga en paralelo
//	Diseño y Test de Ciruitos Integrados
//
////////////////////////////////////////////////////////////////


module shift_reg_right(data_out, data_in, load, shift, clear, clk);

  output [23:0] data_out;
  input [22:0] data_in;
  input load, shift, clear, clk;
  reg [23:0] d;
  
  always @ (posedge clk)
    begin
      if (clear == 1'b1) //este esta hecho asi porque pensaba que se necesitaba orden de relevancia, pero nope
      	    d <= 24'h0;
      else 
        if (load == 1'b1)
            d <= {1'b1,data_in};    
      else 
        if (shift == 1'b1)
          d <= {1'b0, d[23:1]};
    end
  assign data_out = d;
endmodule


module shift_reg_bi(data_out, data_in, load, shift_r, shift_l, clk);

  output [23:0] data_out;
  input [23:0] data_in;
  input load, shift_r, shift_l, clk;
  reg [23:0] d;
  
  always @ (posedge clk)
    begin
      if (load == 1'b1)
      	d <= data_in;
			
      if (shift_l == 1'b1)
        d <= {d[22:0],1'b0};
		  
      if (shift_r == 1'b1)
        d <= {1'b0, d[23:1]};
		  
    end
  assign data_out = d;
endmodule
