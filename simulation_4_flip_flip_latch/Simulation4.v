module gatedRSLatch(Clk, R, S, Q);
	input Clk, R, S;
	output Q;
	wire R_prime, S_prime, Q_a, Q_b;
	
	and(R_prime, R, Clk);
	and(S_prime, Clk, S);
	nor(Q_a, R_prime, Q_b);
	nor(Q_b, S_prime, Q_a);
	
	assign Q = Q_a;	
endmodule

module JKFlipFlop(Clk, J, K, Q);
	input Clk, J, K;
	output reg Q;
	
	always@(negedge Clk)
		if (J == 1'b1 && K == 1'b1)
			Q <= ~Q;
		else if (J == 1'b1 && K == 1'b0)
			Q <= 1'b1;
		else if (J == 1'b0 && K == 1'b1)
			Q <= 1'b0;
endmodule

module DFLipFlop(Clk, D, Enable, Resetn, Q);
	input Clk, D, Enable, Resetn;
	output reg Q;
	
	always@(posedge Resetn, negedge Clk)
		if (Enable)
			if(Resetn)
				Q <= 0;
			else
				Q <= D;
endmodule

module my_DLatch(Clk, D, Q);
	input Clk, D;
	output reg Q;
	
	always@(D, Clk)
		if(Clk)
			Q = D;
endmodule

module DFlipFlop_Master_Slave(Clk, D, Q);
	input Clk, D;
	output Q;	
	wire Q_m, Q_s;
	
	my_DLatch d1(Clk, D, Q_m);
	my_DLatch d2(Clk, Q_m, Q_s);		
	assign Q = Q_s;
		
endmodule

module Top(Out_DFFMS, Out_DFF, Out_JKFF, Out_RSL);
	reg clkSlow;
	reg clkFast;
	output Out_DFFMS, Out_DFF, Out_JKFF, Out_RSL;
	
	always
		#7 clkSlow = ~clkSlow;
		
	always
		#2 clkFast = ~clkFast;
		
	upCount count(clkFast, 0);
		
	gatedRSLatch rs1(clkSlow, 1, 0, Out_RSL);
	gatedRSLatch rs2(clkSlow, 0, 1, Out_RSL);
	gatedRSLatch rs3(clkSlow, 1, 1, Out_RSL);
	gatedRSLatch rs4(clkSlow, 0, 0, Out_RSL);
	
	JKFlipFlop jk1(clkSlow, 1, 0, Out_JKFF);
	JKFlipFlop jk2(clkSlow, 0, 1, Out_JKFF);
	JKFlipFlop jk3(clkSlow, 1, 1, Out_JKFF);
	JKFlipFlop jk4(clkSlow, 0, 0, Out_JKFF);
	
	DFLipFlop dff1(clkSlow, 1, 1, 0, Out_DFF);
	DFLipFlop dff2(clkSlow, 0, 1, 0, Out_DFF);
	DFLipFlop dff3(clkSlow, 0, 0, 0, Out_DFF);
	DFLipFlop dff4(clkSlow, 1, 1, 1, Out_DFF);
	
	DFlipFlop_Master_Slave ms1(clkSlow, 1, Out_DFFMS);
	DFlipFlop_Master_Slave ms2(clkSow, 0, Out_DFFMS);
endmodule

module upCount(clkFast, reset);
	input clkFast, reset;
	reg[7:0] count;
	always@(posedge clkFast)
	begin	
		if (reset)
			count <= 8'h00;
		else
			count <= count + 8'h01;
	end
endmodule