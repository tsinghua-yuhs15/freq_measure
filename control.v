module control(
  resetb,
  clk,
  counter_en,
  reset,
  latch
);

input clk,resetb;
output counter_en,reset,latch;

reg state;
reg counter_en,reset,latch;

initial begin
  state<=0;
end

always @(posedge clk or negedge resetb) begin
	if(~resetb) begin
	 counter_en<=0;
	 reset<=1;
	 //0为归零，1为锁定
	 latch<=0;
	end
	else begin
    if(!state) begin
      counter_en<=1;
      reset<=1;
      latch<=0;
    end
    else begin
      counter_en<=0;
      reset<=0;
      latch<=1;
    end
    state<=~state;
	end
 end
endmodule 
