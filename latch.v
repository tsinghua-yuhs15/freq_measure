module latcher(
  latch,
  in,
  out
);

input latch;
input [15:0] in;
output [15:0] out;

reg [15:0] out;

initial out<=0;

always @(*) begin
  if(~latch)
    out<=in;
end

endmodule // 