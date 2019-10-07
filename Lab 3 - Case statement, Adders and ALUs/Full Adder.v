module ripple-carryadder(A,B,Cin,S,Cout);
	input [2:0] A, B;
	input Cin;
	output [2:0]s;
	output Cout;
	wire c1, c2;
	
	FA Bit0(A[0], B[0], Cin, 5[0], c1);
	FA Bit1(A[1], B[1], C1, S[1], C2);
	FA Bit2(A[2], B[2], C2, S[2], Cout);
endmodule

module FA(input a, b, Cin, output s, Cout);
	assign S = Cin^b^a;
	assign Cout = (b&a)|(Cin&b)|(Cin&a);
endmodule
