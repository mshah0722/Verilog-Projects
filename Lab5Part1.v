module Lab5Part1(SW, KEY, HEX0, HEX1);
	//SW[0] = Clear
	//SW[1] = Enable
	input [1:0]SW;
	
	//Clock
	input [1:0]KEY;
	
	//Output HEX Display
	output [6:0]HEX0, HEX1;
	
	//Wire Connections
	wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14;
	
	assign w1 = SW[1] & w0;
	assign w3 = w1 & w2;
	assign w5 = w3 & w4;
	assign w7 = w5 & w6;
	assign w9 = w7 & w8;
	assign w11 = w9 & w10;
	assign w13 = w11 & w12;
	
	t_flip_flop_async_reset t0(.enable(SW[1]), .clock(~KEY[0]), .clearb(SW[0]), .w(w0));
	t_flip_flop_async_reset t1(.enable(w1), .clock(~KEY[0]), .clearb(SW[0]), .w(w2));
	t_flip_flop_async_reset t2(.enable(w3), .clock(~KEY[0]), .clearb(SW[0]), .w(w4));
	t_flip_flop_async_reset t3(.enable(w5), .clock(~KEY[0]), .clearb(SW[0]), .w(w6));
	t_flip_flop_async_reset t4(.enable(w7), .clock(~KEY[0]), .clearb(SW[0]), .w(w8));
	t_flip_flop_async_reset t5(.enable(w9), .clock(~KEY[0]), .clearb(SW[0]), .w(w10));
	t_flip_flop_async_reset t6(.enable(w11), .clock(~KEY[0]), .clearb(SW[0]), .w(w12));
	t_flip_flop_async_reset t7(.enable(w13), .clock(~KEY[0]), .clearb(SW[0]), .w(w14));
	
	hex_decoder h0(w6, w4, w2, w0, HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]);
	hex_decoder h1(w14, w12, w10, w8, HEX1[0], HEX1[1], HEX1[2], HEX1[3], HEX1[4], HEX1[5], HEX1[6]);
	
endmodule


module t_flip_flop_async_reset(enable, clock, clearb, w);
	input enable, clock, clearb;
	output reg w;
	always @ (posedge clock, posedge clearb)
		begin
			if (clearb==1'b1)
				w <= 0;
			else if(enable==1'b1)
				w <= ~w;
		end
endmodule

module hex_decoder(input a, b, c, d, output f0, f1, f2, f3, f4, f5, f6);
	assign f0 = (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (a & ~b & c & d) | (a & b & ~c & d) ;
	assign f1 = (~a & b & ~c & d) | (~a & b & c & ~d) | (a & ~b & c & d) | (a & b & ~c & ~d) | (a & b & c & ~d) | (a & b & c & d) ;
	assign f2 = (~a & ~b & c & ~d) | (a & b & ~c & ~d) | (a & b & c & ~d) | (a & b & c & d) ;
	assign f3 = (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (~a & b & c & d) | (a & ~b & c & ~d) | (a & b & c & d);
	assign f4 = (~a & ~b & ~c & d) | (~a & ~b & c & d) | (~a & b & ~c & ~d) | (~a & b & ~c & d) | (~a & b & c & d) | (a & ~b & ~c & d);
	assign f5 = (~a & ~b & ~c & d) | (~a & ~b & c & ~d) | (~a & ~b & c & d) | (~a & b & c & d) | (a & b & ~c & d);
	assign f6 = (~a & ~b & ~c & ~d) | (~a & ~b & ~c & d) | (~a & b & c & d) | (a & b & ~c & ~d);
endmodule
