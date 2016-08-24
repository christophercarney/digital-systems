module Taupe (A,B,Cin,Sum,Cout);
	input [1:0] A;
	input [1:0] B;
	input Cin;
	output [1:0] Sum;
	output Cout;

	reg [2:0] tmp;
	assign Cout= tmp[2];
	assign Sum = tmp[1:0];

	always@(A,B,Cin)
	  case({A,B,Cin})
	    5'b00000: tmp = 3'b000;
	    5'b00110: tmp = 3'b011;
	    5'b00010: tmp = 3'b001;
	    5'b00001: tmp = 3'b001;
	    5'b00011: tmp = 3'b010;
	    5'b00100: tmp = 3'b010;
	    5'b00101: tmp = 3'b011;
	    5'b01000: tmp = 3'b001;
	    5'b00111: tmp = 3'b100;
	    5'b01001: tmp = 3'b010;
	    5'b01010: tmp = 3'b010;
	    5'b01100: tmp = 3'b011;
	    5'b01011: tmp = 3'b011;
	    5'b01101: tmp = 3'b100;
	    5'b10010: tmp = 3'b011;
	    5'b10110: tmp = 3'b101;
	    5'b10111: tmp = 3'b101;
	    5'b11100: tmp = 3'b101;
	    5'b11110: tmp = 3'b110;
	    5'b11101: tmp = 3'b110;
	    5'b11111: tmp = 3'b111;
	    5'b01110: tmp = 3'b100;
	    5'b10011: tmp = 3'b100;
	    5'b10100: tmp = 3'b100;
	    5'b10101: tmp = 3'b101;
	    5'b11000: tmp = 3'b011;
	    5'b11001: tmp = 3'b100;
	    5'b11011: tmp = 3'b101;
	    5'b01111: tmp = 3'b101;
	    5'b10000: tmp = 3'b010;
	    5'b10001: tmp = 3'b011;
	    5'b11010: tmp = 3'b100;
	  endcase

endmodule
