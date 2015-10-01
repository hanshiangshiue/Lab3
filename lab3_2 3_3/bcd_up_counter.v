`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:05 08/18/2015 
// Design Name: 
// Module Name:    bcd_up_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bcd_up_counter(
	input clk,
	input rst_n,
	output [3:0] ftsd_ctl,
	output [14:0] display,
	input start
    );
	
	wire [3:0] bcd;
	wire [1:0] clk_ctl;
	wire [3:0] in0, in1, in2, in3;
	
	
	wire clk_out;
	
	reg finish;
	reg [3:0] c2,c3,c2_next,c3_next;
	reg [3:0] sum;
	
	
	
	
	
	always@(*)
	begin
		if(c3<4'd9)
		begin
			c2_next=c2;
			c3_next=c3+4'd1;
			finish=1'b0;
		end
		else if(c2<4'd9 && c3==4'd9)
		begin
			c3_next=4'd0;
			c2_next=c2+4'd1;
			finish=1'b0;
		end
		else if(c2==4'd9 && c3==4'd9)
		begin
			c3_next=4'd0;
			c2_next=4'd0;
			finish=1'b1;
		end
		else
		begin
			c3_next=4'd0;
			c2_next=4'd0;
			finish=1'b1;
		end
	end



	
	always@(posedge clk_out or negedge rst_n)
	begin
		if(~rst_n || start==1'b0)
		begin
			c2<=4'd0;
			c3<=4'd0;
		end
		else if(start==1'b1 && finish==1'b0)
		begin
			c2<=c2_next;
			c3<=c3_next;
		end
		else
		begin
			c2<=c2;
			c3<=c3;
		end
	end
		
	
	
	
	
	
	
	assign in0=4'd0;
	assign in1=4'd0;
	assign in2=c2;
	assign in3=c3;
	
	
freq_div f1(
	.clk_out(clk_out),
	.clk_ctl(clk_ctl), // divided clock output
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	);

bcd2ftsegdec b1( 
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);

scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(in0), // 1st input
	.in1(in1), // 2nd input
	.in2(in2), // 3rd input
	.in3(in3), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);


endmodule
