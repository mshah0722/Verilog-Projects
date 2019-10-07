  `timescale 1ns / 1ns // `timescale time_unit/time_precision

//module alu (input [8:0]SW, [2:0]KEY, output[9:0] LEDR, [6:0]HEX0, [6:0]HEX1, [6:0]HEX2, [6:0]HEX3, [6:0]HEX4);//for experiment, so added more inputs
module lab3part3modified (input [8:0]SW, input [2:0]KEY, output [9:0] LEDR, output [6:0]HEX0, output [6:0]HEX1, output [6:0]HEX2, output [6:0]HEX3, output [6:0]HEX4);//for experiment, so added more inputs

	aluModule b4(SW[8:0], KEY[2:0], LEDR[9:0], HEX0[6:0], HEX1[6:0], HEX2[6:0], HEX3[6:0], HEX4[6:0] );

endmodule

module aluModule ( input [8:0]sw, input [2:0]key, output reg [9:0]ledr , output [6:0]hex0, output [6:0] hex1, output [6:0]hex2, output [6:0]hex3, output reg [6:0]hex4);// I added SW[8] and 

	wire w0, w1, w2, w3, w4, w5;
	wire [8:0] wSW;
	wire [9:0] wireLED;
	reg [3:0] signalOutput2;
	reg [3:0] signalOutput3;
	reg [7:0] bus;

//	
//	bus = {signal};
//	localparam c1;

fourBitRippleAdder b0( sw[8:0], wireLED[9:0]);
hexDecoder a0( sw[3:0], hex0[6:0] );
hexDecoder b1( sw[7:4], hex1[6:0] );
hexDecoder output2( signalOutput2[3:0], hex2[6:0] );
hexDecoder output3( signalOutput3[3:0], hex3[6:0] );


	always@(*)
	begin
		case (key[2:0])
		 0:begin
			ledr[3:0] = wireLED[3:0] ;// tried to [3:0] and [9],but cannot // .switch[8:0](SW[8:0]), .led[3:0](LEDR[7:0]), .led[9](LEDR[7])  // 
			ledr[9] = wireLED[9];
			signalOutput2[3:0] = wireLED[3:0]; 
	//		HEX0		
			end
			
		 1:begin
			 ledr[9:0] = sw[3:0] + sw[7:4];
			 bus[7:0] = sw[3:0] + sw[7:4];
			 signalOutput2[3:0] = bus[3:0];
			 signalOutput3[3:0] = bus[7:4];
			 
			end
		 
		 2:begin 
			 ledr[3:0] = (sw[3:0] & sw[7:4]) | (~sw[3:0] | ~sw[7:4]);
			 ledr[7:4] = ~(sw[3:0] & sw[7:4]);
			 signalOutput2[3:0] = ledr[3:0];
			 signalOutput3[3:0] = ledr[7:4];
			 
			end		
		 
		 3:if( (|sw[3:0])|(|sw[3:0]) ) // i deleted the |
				ledr[7:0] = 8'b00001111;			
	//ask if there is any shortcut for this #4	
		 4:if( sw[7:0] == 8'b10001100)
			begin
			  ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b01001100) 
			begin
			  ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			end			 
			else if(sw[7:0] == 8'b00101100) 
			begin
			  ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			end
			else if(sw[7:0] == 8'b00011100)
			begin	
			  ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
//////////////////////////////////////////////			
			else if(sw[7:0] == 8'b10000110) 
			begin
			  ledr[8:0] = 8'b11110000;
			   bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b01000110)
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b00100110) 
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b00010110) 
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
/////////////////////////////////////////////
			else if(sw[7:0] == 8'b10000011)
			begin	
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			end
			else if(sw[7:0] == 8'b01000011)
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b00100011) 
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b00010011) 
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
/////////////////////////////////////////////
			else if(sw[7:0] == 8'b10001001) 
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b01001001) 
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b00101001) 
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end
			else if(sw[7:0] == 8'b00011001) 
			begin
			 ledr[8:0] = 8'b11110000;
			  bus[7:0] = sw[7:0];
			  signalOutput2[3:0] = bus[3:0];
			  signalOutput3[3:0] = bus[7:4];
			 end

			 
		 5:begin 
			 ledr[7:4] = sw[7:4];
			 ledr[0] = ~sw[0];
			 ledr[1] = ~sw[1];
			 ledr[2] = ~sw[2];
			 ledr[3] = ~sw[3];

			 signalOutput2[0] = ~sw[0];
			 signalOutput2[1] = ~sw[1];
			 signalOutput2[2] = ~sw[2];
			 signalOutput2[3] = ~sw[3];
			  signalOutput3[3:0] = sw[7:4];
			 
			end
			

			
		 default: ledr[9] = 1;
		endcase
	end
endmodule


/////////////////////////////////////////////////////////////////////////////////////////////////////
module fourBitRippleAdder( input [8:0]switch, output [9:0]led );
	wire w0, w1, w2;
	fullAdder b0( switch[4], switch[0], switch[8], w0, led[0]);		
	fullAdder b1( switch[5], switch[1], w0, w1, led[1]);	
	fullAdder b2( switch[6], switch[2], w1, w2, led[2]);	
	fullAdder b3( switch[7], switch[3], w2, led[9], led[3]);	

endmodule


module fullAdder(	input a, b, ci, output co, s );
	assign co = ( a & ci ) + ( b & ~a & ci ) + ( b & a & ~ci );
	assign s = ( ~b & ~a & ci ) + ( ~b & a & ~ci ) + ( b & ~a & ~ci) + ( b & a & ci );	

endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////
module hexDecoder(input [3:0] SW, output [6:0] HEX0);

	hex b1(
		.a(SW[3]),
		.b(SW[2]),
		.c(SW[1]),
		.d(SW[0]),

		.f0(HEX0[0]),
		.f1(HEX0[1]),
		.f2(HEX0[2]),
		.f3(HEX0[3]),
		.f4(HEX0[4]),
		.f5(HEX0[5]),
		.f6(HEX0[6])

		);
endmodule


module hex( input a, b, c, d, output f0, f1, f2, f3, f4, f5, f6 );
	
	assign f0 = (~a & ~b & ~c & d) + (~a & b & ~c & ~d) + (a & ~b & c & d) + (a & b & ~c & d); 
 
	assign f1 = (~a & b & ~c & d) + (~a & b & c & ~d) + (a & ~b & c & d) 
			+ (a & b & ~c & ~d) + (a & b & c & ~d) + (a & b & c & d) ;

	assign f2 = (~a & ~b & c & ~d) + (a & b & ~c & ~d) + (a & b & c & ~d) + (a & b & c & d);

	assign f3 = (~a & ~b & ~c & d) + (~a & b & ~c & ~d) + (~a & b & c & d) + (a & ~b & c & ~d)
			+ (a & b & c & d);

	assign f4 = (~a & ~b & ~c & d) + (~a & ~b & c & d) + (~a & b & ~c & ~d) + (~a & b & ~c & d)
			+ (~a & b & c & d) + (a & ~b & ~c & d); 

	assign f5 = (~a & ~b & ~c & d) + (~a & ~b & c & ~d) + (~a & ~b & c & d) + (~a & b & c & d) 
	+ (a & b & ~c & d);

	assign f6 = (~a & ~b & ~c & ~d) + (~a & ~b & ~c & d) + (~a & b & c & d) + (a & b & ~c & ~d);


endmodule

