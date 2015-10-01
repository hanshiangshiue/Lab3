`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:47 08/18/2015 
// Design Name: 
// Module Name:    synchronous_binary_up_counter_4bit 
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
module synchronous_binary_up_counter_4bit(
    input clk,
    input rst_n,
	 output counter
    );


reg [3:0] counter;
reg [3:0] c_next;

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		counter<=4'd0;
	else
		counter<=c_next;
end


always@(counter)
begin
	if(counter==4'd15)
		c_next=4'd0;
	else
		c_next=counter+4'd1;
end

endmodule
