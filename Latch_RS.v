module latch_rs(
	input R, S, 
	output reg Q);

  always @(R or S) begin
    if (R == 1)
      Q <= 0;
    else if (S == 1)
      Q <= 1;
  end
endmodule
