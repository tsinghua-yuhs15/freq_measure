module divide(
  divide,
  clk_in,
  clk_out
);

input[25:0] divide;
input clk_in;
output clk_out; 

reg clk_out;
reg[25:0] state;

initial begin
  clk_out<=0;
  state<=26'd0;
end

always @(posedge clk_in) begin
  if(state==26'd0)
    clk_out=~clk_out;
  state<=state+26'd2;
  if(state==divide-2)
    state<=26'd0;
end

endmodule // 