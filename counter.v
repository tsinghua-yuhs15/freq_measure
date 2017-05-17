module counter(
  clk,
  reset,
  counter_en,
  out
);

input clk,reset,counter_en;
output[15:0] out;

reg[3:0] cnt0,cnt1,cnt2,cnt3;

assign out={cnt3,cnt2,cnt1,cnt0};

initial begin
  cnt3=0;
  cnt2=0;
  cnt1=0;
  cnt0=0;
end

always @(posedge clk,negedge reset) begin
  if(~reset) begin
    cnt3=0;
    cnt2=0;
    cnt1=0;
    cnt0=0;
  end
  else begin
    if(counter_en) begin
      if(cnt2==9&&cnt1==9&&cnt0==9)begin
        cnt3=cnt3+1;
        cnt2<=0;
        cnt1<=0;
        cnt0<=0;
      end
      else if(cnt1==9&&cnt0==9) begin
        cnt2<=cnt2+1;
        cnt1<=0;
        cnt0<=0;
      end
      else if(cnt0==9) begin
        cnt1=cnt1+1;
        cnt0<=0;
      end
      else cnt0<=cnt0+1;
    end
  end
end

endmodule // counter