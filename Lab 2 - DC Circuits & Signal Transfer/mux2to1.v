// Verilog code for lab2 part2

module mux2to1(LEDR, SW); // mux2to1 (Multiplexer)
    input [9:0] SW;
    output [9:0] LEDR; 
	 
	 wire w1, w2, w3;
	 
	 V7432 u1(
        .pin1(SW[0]),
        .pin2(w1),
        .pin3(w2)
		);
		  
	 V7432 u2(	
        .pin4(SW[1]),
		.pin5(SW[9]),
		.pin6(w3)
        );
		  
	 V7408 u3(
        .pin1(SW[9]),
		.pin2(w1)
        );
		  
	 V7404 u4(
        .pin1(w2),
        .pin2(w3),
        .pin3(LEDR[0]) 
        );

endmodule

module V7408 (input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13,
				  output pin3, pin6, pin8, pin11); // v7408 (AND Gate) 
	assign pin3 = pin1 & pin2;
	assign pin6 = pin4 & pin5;
	assign pin8 = pin10 & pin9;
	assign pin11 = pin13 & pin12;
	
endmodule

module V7404 (input pin1, pin3, pin5, pin9, pin11, pin13,
				  output pin2, pin4, pin6, pin8, pin10, pin12); // v7404 (NOT Gate) 
	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin8 = ~pin9;
	assign pin10 = ~pin11;
	assign pin12 = ~pin13;
	
endmodule

module V7432 (input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13,
				  output pin3, pin6, pin8, pin11); //  v7432 (OR Gate) 
	assign pin3 = pin1 | pin2;
	assign pin6 = pin4 | pin5;
	assign pin8 = pin10 | pin9; 
	assign pin11 = pin13 | pin12;
	
endmodule

