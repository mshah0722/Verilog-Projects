

module lab4part3(SW, KEY, LEDR);
	//SW[7:0] -> DATA_IN
	//SW[9] -> reset
	input [9:0] SW;
	
	//KEY[0] ->clock
	//KEY[1] ->ParallelLoadn
	//KEY[2] ->Rotate Right
	//KEY[3] ->ASRight
	input [3:0] KEY;
	
	output [7:0] LEDR;
	mux2to1 AS_Shift(.s(KEY[3]), .y(LEDR[7]), .x(LEDR[0]), .m(AS));

	//bit numbering from left to right
	rotate_register bit7(
		.data_left(AS),
	 	.data_right(LEDR[6]), 
		.load_left(KEY[2]),
		.data_D(SW[7]),
		.loadn(KEY[1]),
		.clock(KEY[0]),
		.reset(SW[9]),
		.outQ(LEDR[7])
	);

	rotate_register bit6(
		.data_left(LEDR[7]),
	 	.data_right(LEDR[5]), 
		.load_left(KEY[2]),
		.data_D(SW[6]),
		.loadn(KEY[1]),
		.clock(KEY[0]),
		.reset(SW[9]),
		.outQ(LEDR[6])
	);

	rotate_register bit5(
		.data_left(LEDR[6]),
	 	.data_right(LEDR[4]), 
		.load_left(KEY[2]),
		.data_D(SW[5]),
		.loadn(KEY[1]),
		.clock(KEY[0]),
		.reset(SW[9]),
		.outQ(LEDR[5])
	);

	rotate_register bit4(
		.data_left(LEDR[5]),
	 	.data_right(LEDR[3]), 
		.load_left(KEY[2]),
		.data_D(SW[4]),
		.loadn(KEY[1]),
		.clock(KEY[0]),
		.reset(SW[9]),
		.outQ(LEDR[4])
	);	

	rotate_register bit3(
		.data_left(LEDR[4]),
	 	.data_right(LEDR[2]), 
		.load_left(KEY[2]),
		.data_D(SW[3]),
		.loadn(KEY[1]),
		.clock(KEY[0]),
		.reset(SW[9]),
		.outQ(LEDR[3])
	);	
	rotate_register bit2(
		.data_left(LEDR[3]),
	 	.data_right(LEDR[1]), 
		.load_left(KEY[2]),
		.data_D(SW[2]),
		.loadn(KEY[1]),
		.clock(KEY[0]),
		.reset(SW[9]),
		.outQ(LEDR[2])
	);	
	rotate_register bit1(
		.data_left(LEDR[2]),
	 	.data_right(LEDR[0]), 
		.load_left(KEY[2]),
		.data_D(SW[1]),
		.loadn(KEY[1]),
		.clock(KEY[0]),
		.reset(SW[9]),
		.outQ(LEDR[1])
	);	
	rotate_register bit0(
		.data_left(LEDR[1]),
	 	.data_right(LEDR[7]), 
		.load_left(KEY[2]),
		.data_D(SW[0]),
		.loadn(KEY[1]),
		.clock(KEY[0]),
		.reset(SW[9]),
		.outQ(LEDR[0])
	);	

endmodule
//SW[7:0] -> DATA_IN

//SW9 synchronus active high reset
//KEY 1 parralelloadn
//key 2 rotate right
//key 3 asright
//key 0 clock
//led -> output Q
module rotate_register(data_left, data_right, load_left, data_D, loadn, clock, reset, outQ);
	input data_left, data_right, load_left, data_D, loadn, clock, reset; 
	output outQ;
	wire rotatedata, datato_dff, AS;
	mux2to1 M0(
		.x(data_right),
		.y(data_left),
		.s(load_left),
		.m(rotatedata)
	);
	mux2to1 M1(
		.x(data_D),
		.y(rotatedata),
		.s(loadn),
		.m(datato_dff)
	);

	flipflop F0(
		.d(datato_dff),
		.q(outQ),
		.clock(clock),
		.reset(reset)
	);
endmodule

module mux2to1(x, y, s, m);
    input x; 
    input y; 
    input s; 
    output m; 
    assign m = s?x:y;
endmodule

module flipflop(d, q, clock, reset);
	input d;
	input clock;
	input reset;
	output reg q;

	always@(posedge clock)
	begin
	if(reset == 1)
		q<=0;
	else
		q<=d;
	end
endmodule












/*module lab4part3(SW, KEY, LEDR);
	input [9:0] SW;
	//SW[7:0] -> DATA_IN
	//SW[9] -> A synchronous active high reset (reset_n)
	
	input [3:0] KEY;
	//KEY[0] ->clock
	//KEY[1] ->ParallelLoadn
	//KEY[2] ->Rotate Right
	//KEY[3] ->ASRight
	
	output [7:0] LEDR;

	rotatingRegister r1(
		.clock(KEY[0]),
		.reset(SW[9]),
		.parallelLoadIn(KEY[1]),
		.rotateRight(KEY[2]),
		.ASright(KEY[3]),
		.dataIn(SW[7:0]),
		.Q(LEDR[7:0])
	);
	
endmodule

module rotatingRegister(input reset, clock, parallelLoadIn, rotateRight, ASright, input [7:0] dataIn, output [7:0] Q);
	
	wire [7:0] q;
	
	wire AS;
	
	
	mux2to1 AS_Shift(.s(ASright), .a(q[7]), .b(q[0]), .out(AS));

	
	singleBitRotatingRegister bit7(.clk(clock), .reset(reset), .loadIn(parallelLoadIn), .rotateRight(rotateRight), 
								   .dataIn(dataIn[7]), .Qleft(AS), .Qright(q[6]), .Q(q[7]));

	singleBitRotatingRegister bit6(.clk(clock), .reset(reset), .loadIn(parallelLoadIn), .rotateRight(rotateRight), 
								   .dataIn(dataIn[6]), .Qleft(q[7]), .Qright(q[5]), .Q(q[6]));

	singleBitRotatingRegister bit5(.clk(clock), .reset(reset), .loadIn(parallelLoadIn), .rotateRight(rotateRight), 
								   .dataIn(dataIn[5]), .Qleft(q[6]), .Qright(q[4]), .Q(q[5]));

	singleBitRotatingRegister bit4(.clk(clock), .reset(reset), .loadIn(parallelLoadIn), .rotateRight(rotateRight), 
								   .dataIn(dataIn[4]), .Qleft(q[5]), .Qright(q[3]), .Q(q[4]));

	singleBitRotatingRegister bit3(.clk(clock), .reset(reset), .loadIn(parallelLoadIn), .rotateRight(rotateRight), 
								   .dataIn(dataIn[3]), .Qleft(q[4]), .Qright(q[2]), .Q(q[3]));

	singleBitRotatingRegister bit2(.clk(clock), .reset(reset), .loadIn(parallelLoadIn), .rotateRight(rotateRight), 
								   .dataIn(dataIn[2]), .Qleft(q[3]), .Qright(q[1]), .Q(q[2]));

	singleBitRotatingRegister bit1(.clk(clock), .reset(reset), .loadIn(parallelLoadIn), .rotateRight(rotateRight), 
								   .dataIn(dataIn[1]), .Qleft(q[2]), .Qright(q[0]), .Q(q[1]));

	singleBitRotatingRegister bit0(.clk(clock), .reset(reset), .loadIn(parallelLoadIn), .rotateRight(rotateRight), 
								   .dataIn(dataIn[0]), .Qleft(q[1]), .Qright(q[7]), .Q(q[0]));

	assign Q = q;

endmodule

module singleBitRotatingRegister(input clk, reset, loadIn, rotateRight, dataIn, Qleft, Qright, output Q);
	
	wire w1, Win;

	
	mux2to1 rotate  (.s(rotateRight), .a(Qleft), .b(Qright), .out(w1));
	
	
	mux2to1 load    (.s(loadIn), .a(w1), .b(dataIn), .out(Win));

	
	D_ff flipflop(.D(Win), .reset(reset), .clk(clk), .Q(Q));
endmodule


module D_ff (input D, reset, clk, output reg Q);	
	always @(posedge clk)
	begin 
		if (reset == 1'b1)
			Q <= 0;
		else
			Q <= D;
	end	
endmodule

module mux2to1(input s, a, b, output out);
	assign out = s?b:a;
endmodule


*/
