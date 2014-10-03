`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:03:27 10/03/2014 
// Design Name: 
// Module Name:    topmodule 
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
module divider(
reset,
out,
clk
);

output out;
input clk;
input reset;

parameter divisor1 = 5;
parameter divisor2 = 2;

reg[31:0] cnt1;
reg result;
wire EN;
wire compare1,compare2;


// counter
always@(posedge clk or negedge reset)
begin
   if(reset == 0)
      cnt1 <= 0;
	else if(cnt1 == divisor1)
		cnt1 <= 1;
	else
		cnt1 <= cnt1 + 1;
end

//comparatorA for posedge
assign compare1 = (cnt1 == 5) ? 1 : 0;

//comparatorB for nevedge
assign compare2 = (cnt1 == divisor2) ? 1 : 0;

assign EN = compare1 | compare2;
 
// D-type flip-flop output 
// posedge clk && (compareA || compareB) ???
always@(posedge clk or negedge reset)
begin
	if(reset == 0)
		result <= 0;
	else if(EN) 
	result <= !result;
		// do nothing
end

assign out = result;
endmodule

