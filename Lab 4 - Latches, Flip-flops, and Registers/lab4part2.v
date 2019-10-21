//Lab4: Part 2 Flip Flop 


`timescale 1ns / 1ns // `timescale time_unit/time_precision


module lab4part2(SW, KEY, LEDR , HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);//SW, KEY, LEDR , HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
	input [9:0]SW;
	input [3:0]KEY;
	
	output [7:0]LEDR;
	output [6:0]HEX0; // A
	output [6:0]HEX1; // 0
	output [6:0]HEX2; // 0
	output [6:0]HEX3; // 0
	output [6:0]HEX4; // Least Significant Four Bits 
	output [6:0]HEX5; // Most significant Four Bits

	wire [7:0]W1;
	wire [7:0]W2;

	assign LEDR = W1;
		
	ALUModule u1(SW[3:0], W1[3:0], KEY[3:1], W1[7:0], W2[7:0]);
	registerModule u2(SW[9], W2[7:0], KEY[0], W1[7:0]);
		
	hexDecoder H0(SW[3], SW[2], SW[1], SW[0], HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]);
	hexDecoder H1(1'b0, 1'b0, 1'b0, 1'b0, HEX1[0], HEX1[1], HEX1[2], HEX1[3], HEX1[4], HEX1[5], HEX1[6]);
	hexDecoder H2(1'b0, 1'b0, 1'b0, 1'b0, HEX2[0], HEX2[1], HEX2[2], HEX2[3], HEX2[4], HEX2[5], HEX2[6]);
	hexDecoder H3(1'b0, 1'b0, 1'b0, 1'b0, HEX3[0], HEX3[1], HEX3[2], HEX3[3], HEX3[4], HEX3[5], HEX3[6]);
	hexDecoder H4(W1[3], W1[2], W1[1], W1[0], HEX4[0], HEX4[1], HEX4[2], HEX4[3], HEX4[4], HEX4[5], HEX4[6]);
	hexDecoder H5(W1[7], W1[6], W1[5], W1[4], HEX5[0], HEX5[1], HEX5[2], HEX5[3], HEX5[4], HEX5[5], HEX5[6]);
endmodule

module registerModule(reset, D, CLK, Q);
	input reset;
	input [7:0]D;
	input CLK;
	output reg [7:0]Q;
	always@(posedge CLK)
		if(reset == 1'b0)
			Q <= 0;
		else
			Q <= D;	
endmodule

module ALUModule(A, B, ALUSelect, hold, ALUout);
	input [3:0]A,B;
	input [2:0]ALUSelect;
	input [7:0]hold;
	output reg [7:0]ALUout;
	wire [4:0]C1;
	rippleAdder r1(.A(A[3:0]),.B(B[3:0]),.S(C1[3:0]),.Cin(1'b0),.Cout(C1[4]));
	always@(*)
		case (ALUSelect[2:0])
			3'b111: ALUout = {3'b000, C1};
			3'b110: ALUout = A + B;
			3'b101: ALUout = {~(A & B) , ~(A ^ B)};
			3'b100: 
					begin
						if(A|B == 1)
							ALUout  = 8'b00001111;
						else
							ALUout = 8'b0;
					end
			3'b011: ALUout = ((A[1]&~A[2]&~A[3]&~A[0]) | (~A[1]&A[2]&~A[3]&~A[0]) | (~A[1]&~A[2]&A[3]&~A[0]) | (~A[1]&~A[2]&~A[3]&A[0])) & ((~B[1]&~B[2]&B[3]&B[0]) | (B[1]&~B[2]&~B[3]&B[0])| (~B[1]&B[2]&~B[3]&B[0]) | (~B[1]&B[2]&B[3]&~B[0]) | (B[1]&~B[2]&B[3]&~B[0]) | (B[1]&B[2]&~B[3]&~B[0])) ? (8'b11110000) : (8'b00000000);
			3'b010: ALUout = {A[3:0], ~B[3:0]};
			3'b001: ALUout = hold;
			default: ALUout = 8'b00000000;
		endcase
endmodule

module rippleAdder(A,B,S,Cin,Cout);
	input [3:0]A,B;
	input Cin;
	output [3:0]S;
	output Cout;
	wire C1,C2,C3;
	fullAdder FA0(A[0],B[0],Cin,S[0],C1);
	fullAdder FA1(A[1],B[1],C1,S[1],C2);
	fullAdder FA2(A[2],B[2],C2,S[2],C3);
	fullAdder FA3(A[3],B[3],C3,S[3],Cout);
endmodule

module fullAdder(x,y,cin,s,cout);
	input x,y;
	input cin;
	output s;
	output cout;
	assign s = cin ^ x ^ y;
	assign cout =  (x&cin) |  (x&y) |  (y&cin) ;
endmodule

                                                                                                            
module hexDecoder (input a, b, c, d, output f0, f1, f2, f3, f4, f5, f6);
	assign f0 = (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (a & ~b & c & d) | (a & b & ~c & d) ;
	assign f1 = (~a & b & ~c & d) | (~a & b & c & ~d) | (a & ~b & c & d) | (a & b & ~c & ~d) | (a & b & c & ~d) | (a & b & c & d) ;
	assign f2 = (~a & ~b & c & ~d) | (a & b & ~c & ~d) | (a & b & c & ~d) | (a & b & c & d) ;
	assign f3 = (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (~a & b & c & d) | (a & ~b & c & ~d) | (a & b & c & d);
	assign f4 = (~a & ~b & ~c & d) | (~a & ~b & c & d) | (~a & b & ~c & ~d) | (~a & b & ~c & d) | (~a & b & c & d) | (a & ~b & ~c & d);
	assign f5 = (~a & ~b & ~c & d) | (~a & ~b & c & ~d) | (~a & ~b & c & d) | (~a & b & c & d) | (a & b & ~c & d);
	assign f6 = (~a & ~b & ~c & ~d) | (~a & ~b & ~c & d) | (~a & b & c & d) | (a & b & ~c & ~d);
endmodule
