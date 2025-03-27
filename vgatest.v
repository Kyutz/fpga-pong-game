// Copyright (C) 1991-2009 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II"
// VERSION		"Version 9.0 Build 235 06/17/2009 Service Pack 2 SJ Web Edition"
// CREATED ON	"Thu Dec 05 14:50:18 2019"

module vgatest(
	clock,
	upDown,
	leftRight,
	enableUpDown,
	enableLeftRight,
	R,
	G,
	B,
	H,
	V
);


input	clock;
input	upDown;
input	leftRight;
input	enableUpDown;
input	enableLeftRight;
output	R;
output	G;
output	B;
output	H;
output	V;

wire	[9:0] column;
wire	[9:0] row;
wire	SYNTHESIZED_WIRE_2;





VGAdrive	b2v_inst(
	.clock(clock),
	.red(SYNTHESIZED_WIRE_2),
	
	.blue(SYNTHESIZED_WIRE_2),
	.Rout(R),
	.Gout(G),
	.Bout(B),
	.H(H),
	.V(V),
	.column(column),
	.row(row));


square	b2v_inst1(
	.clk(clock),
	.upDown(upDown),
	.leftRight(leftRight),
	.enableUpDown(enableUpDown),
	.enableLeftRight(enableLeftRight),
	.column(column),
	.row(row),
	.draw(SYNTHESIZED_WIRE_2));


endmodule
