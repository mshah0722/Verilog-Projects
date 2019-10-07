// Verilog code for Lab2 Part 3

module Part3(HEX0,SW);
	input [9:0] SW; 
	output [6:0] HEX0; 
	
	displayLight u0( 
			.C0(SW[0]), 
 			.C1(SW[1]), 
			.C2(SW[2]), 
 			.C3(SW[3]), 
 			.led(HEX0[6:0])
			); 

endmodule 
 
module displayLight(input C0, C1, C2, C3, 
						  output [0:6]led); 
	
	assign led[0]=((~C3 & ~C2 & ~C1 & C0)|(~C3 & C2 & ~C1 & ~C0)|(C3 & ~C2 & C1 & C0)|(C3 & C2 & ~C1 & C0)); 
	
	assign led[1]=((~C3 & C2 & ~C1 & C0)|(~C3 & C2 & C1 & ~C0)|(C3 & ~C2 & C1 & C0)|(C3 & C2 & ~C1 & ~C0)|(C3 & C2 & C1 & ~C0)|(C3 & C2 & C1 & C0)); 
	
	assign led[2]=((~C3 & ~C2 & C1 & ~C0)|(C3 & C2 & ~C1 & ~C0)|(C3 & C2 & C1 & ~C0)|(C3 & C2 & C1 & C0)); 
	
	assign led[3]=((~C3 & ~C2 & ~C1 & C0)|(~C3 & C2 & ~C1 & ~C0)|(~C3 & C2 & C1 & C0)|(C3 & ~C2 & C1 & ~C0)|(C3 & C2 & C1 & C0)); 
	
	assign led[4]=((~C3 & ~C2 & ~C1 & C0)|(~C3 & ~C2 & C1 & C0)|(~C3 & C2 & ~C1 & ~C0)|(~C3 & C2 & ~C1 & C0)|(~C3 & C2 & C1 & C0)|(C3 & ~C2 & ~C1 & C0)); 
	
	assign led[5]=((~C3 & ~C2 & ~C1 & C0)|(~C3 & ~C2 & C1 & ~C0)|(~C3 & ~C2 & C1 & C0)|(~C3 & C2 & C1 & C0)|(C3 & C2 & ~C1 & C0)); 
	
	assign led[6]=((~C3 & ~C2 & ~C1 & ~C0)|(~C3 & ~C2 & ~C1 & C0)|(~C3 & C2 & C1 & C0)|(C3 & C2 & ~C1 & ~C0)); 

endmodule 
