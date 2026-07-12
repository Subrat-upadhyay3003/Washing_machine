module wash_tb;
	reg clk;
	reg rst;
	reg start;
	wire fill_valve;
	wire wash_motor;
	wire rinse_valve;
	wire spin_motor;
	wire done;
 	wash_rtl dut(
	.clk(clk),
	.rst(rst),
	.start(start),
	.fill_valve(fill_valve),
	.wash_motor(wash_motor),
	.rinse_valve(rinse_valve),
	.spin_motor(spin_motor),
	.done(done));
	always #5 clk=~clk;
	initial begin
	clk=0;
	rst=1;
	start=0;
	#10 rst=0;
	#10 start=1;
	#10 start=0;
	#100 $finish;
end
endmodule