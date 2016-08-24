module Top (A,B,Cin,Sum,Cout);
	input [1:0] A;
	input [1:0] B;
	input Cin;
	output [1:0] Sum;
	output Cout;
	
	wire c1;
	
	
	Add_full_0_delay FA0(Sum[0],c1,A[0],B[0],Cin); //Module FA0, all inputs received from Top, outputs split between FA1 (c1) and Top(Sum[0])
	Add_full_0_delay FA1(Sum[1],Cout,A[1],B[1],c1);//Module FA1, inputs from Top(A[1],B[1]) and FA0 (c1), outputs all to Top(Sum[0], Cout)
endmodule


module Add_full_0_delay(sum,c_out,a,b,c_in);
	output sum, c_out;
	input a,b,c_in;
	wire w1, w2, w3;

	Add_half_0_delay M1 (w1,w2,a,b);
	Add_half_0_delay M2 (sum, w3, c_in,w1);
	or M3(c_out, w2,w3);
endmodule

module Add_half_0_delay (sum,c_out,a,b);
	output sum, c_out;
	input a,b;
	xor M1 (sum, a, b);
	and M2 (c_out,a,b);
endmodule
