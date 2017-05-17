module top(
  sysclk,
  resetb,
  mode_ctl,
  testmode,
  range_ext,
  dis1,dis2,dis3,dis4
);

input sysclk,resetb,mode_ctl;
input [1:0] testmode;

output range_ext;
output [6:0] dis1,dis2,dis3,dis4;

wire sigin,range_ext;
wire [6:0] dis1,dis2,dis3,dis4;

signalinput si (.sysclk(sysclk),.resetb(resetb),.testmode(testmode),.sigin(sigin));

frequency_test ft (.resetb(resetb),.sig_in(sigin),.sys_clk(sysclk),.mode_ctl(mode_ctl),.range_ext(range_ext),.dis1(dis1),.dis2(dis2),.dis3(dis3),.dis4(dis4));

endmodule // top