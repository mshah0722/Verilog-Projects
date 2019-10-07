module mux6to1(SW, LEDR);// mux6to1 (Multiplexer)
	input [9:0]SW;
	output [9:0] LEDR; 
	mux6to1code u1(.Input(SW[5:0]), .MuxSelect(SW[9:7]), .Out(LEDR[0]));
endmodule

module mux6to1code(Input, MuxSelect, Out);
	input [5:0]Input;
	input [2:0]MuxSelect;
	output Out;
	reg Out; // reg Out declares the output signal for the always block
	
	always@(*) // declare always block
	begin
		case (MuxSelect[2:0]) // start case statement
			3'b000: Out = Input[0]; // case 0 
			3'b001: Out = Input[1]; // case 1 
			3'b010: Out = Input[2]; // case 2 
			3'b011: Out = Input[3]; // case 3
			3'b100: Out = Input[4]; // case 4
			3'b101: Out = Input[5]; // case 5
			default: Out = 1'b0; // default case
		endcase
	end
endmodule
