module signalinput(sysclk,resetb,testmode,sigin);
input sysclk,resetb;
input [1:0] testmode;
output reg sigin;
reg [20:0] divide;
reg [20:0] state;

initial
begin
  state = 21'd0;
  sigin = 0;
end

always @(*)
begin
  case(testmode)
    2'b00 : divide = 21'd16000;   //3125Hz
    2'b01 : divide = 21'd8000;    //6250Hz
    2'b10 : divide = 21'd1000000; //50Hz
    2'b11 : divide = 21'd4000;    //12500Hz
  endcase
end

always @(posedge sysclk or negedge resetb)
begin
  if(~resetb)
    begin
      sigin <= 1'b0;
      state <= 21'd0;
    end
  else
    begin
      if(state==divide-21'd2) state <= 21'd0;
      else  state <= state + 21'd2;
      sigin <= (state==21'd0) ? ~sigin : sigin;
    end
end

endmodule