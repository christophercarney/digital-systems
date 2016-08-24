module Golden (A,B,Cin,Sum,Cout);
	input [1:0] A;
	input [1:0] B;
	input Cin;
	output [1:0] Sum;
	output Cout;

	wire [2:0] A3;
	wire [2:0] B3;
	wire [2:0] Sum3;

	assign A3 = {1'b0,A};
	assign B3 = {1'b0,B};
	assign Sum3 = A3+B3+Cin;
	assign Sum[1:0] = Sum3[1:0];
	assign Cout = Sum3[2];

endmodule