`timescale 1ns/1ns

module test;

reg sysclk,resetb,mode_ctl;
reg  [1:0] testmode;
wire sigin,range_ext;
wire [6:0] dis1,dis2,dis3,dis4;

top t (
  .sysclk(sysclk),
  .resetb(resetb),
  .mode_ctl(mode_ctl),
  .testmode(testmode),
  .range_ext(range_ext),
  .dis1(dis1),.dis2(dis2),.dis3(dis3),.dis4(dis4)
);
initial begin
  sysclk<=0;
  resetb<=0;
  testmode<=2'b11;
  mode_ctl<=1;
  #50 resetb<=1;
end

always #10 sysclk=~sysclk;


endmodule // test