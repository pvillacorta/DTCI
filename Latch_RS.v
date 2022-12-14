module latch_rs(
	input R, S, 
	output reg Q);

  always @(R or S) begin
    if (R)
      Q <= 0;
    else if (S)
      Q <= 1;
  end
endmodule
