module frequency_test(
  resetb,
  sig_in,
  sys_clk,
  mode_ctl,
  range_ext,
  dis1,dis2,dis3,dis4
);

input sig_in,sys_clk,mode_ctl,resetb;
output range_ext;
output [6:0] dis1,dis2,dis3,dis4;

wire sigx;
wire sigu;
wire[25:0] divide;
wire clk_1Hz;
wire ena;
wire reset;
wire latch;
wire [15:0] cnt;
wire [15:0] cnt_;

assign range_ext=mode_ctl;

divide d1(.divide(10),.clk_in(sig_in),.clk_out(sigu));

assign sigx=(mode_ctl)?sigu:sig_in;

divide d2(.divide(50000000),.clk_in(sys_clk),.clk_out(clk_1Hz));

control ct(.resetb(resetb),.clk(clk_1Hz),.counter_en(ena),.reset(reset),.latch(latch));

counter cn(.clk(sigx),.reset(reset),.counter_en(ena),.out(cnt));

latcher l(.latch(latch),.in(cnt),.out(cnt_));

bcd b(.din(cnt_),.dout1(dis1),.dout2(dis2),.dout3(dis3),.dout4(dis4));

endmodule // frequency_test