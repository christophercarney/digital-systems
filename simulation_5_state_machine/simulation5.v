//Christopher Carney
//CMPEN271 Simulation Assignment 5

//The last eight cylces are all 111, it would be expected that
//	the machine would mostly bounce around between the middle states and
//	rarely go to the edge cases.


module entryControl(clock, reset,entered, exited, entryLock, exitLock, lightOn);
	input clock, reset, entered, exited;
	output entryLock, exitLock, lightOn;
	reg [3:1] y;
	parameter [3:1] A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100;
	
	always @ (posedge reset, posedge clock)
		if(reset == 1) y <= A;
		else
			case(y)
				A:	if(entered == 0 && exited == 0) y<=A;
					else if (entered == 1 && exited == 0) y<=B;
				B: if(entered == 0 && exited == 0) y<=B;
					else if (entered == 0 && exited == 1) y<=A;
					else if (entered == 1 && exited == 0) y<=C;
					else if (entered == 1 && exited == 1) y<=B;
				C: if(entered == 0 && exited == 0) y<=C;
					else if (entered == 0 && exited == 1) y<=B;
					else if (entered == 1 && exited == 0) y<=D;
					else if (entered == 1 && exited == 1) y<=C;				
				D: if(entered == 0 && exited == 0) y<=D;
					else if (entered == 0 && exited == 1) y<=C;
					else if (entered == 1 && exited == 0) y<=E;
					else if (entered == 1 && exited == 1) y<=D;				
				E: if(entered == 0 && exited == 0) y<=E;
					else if (entered == 0 && exited == 1) y<=D;
					else if (entered == 1 && exited == 1) y<=E;	//assumes the person leaves before the next enters								
				default: y <= 3'bxxx;
			endcase
			
	assign entryLock = (y != E);
	assign exitLock = (y != A);
	assign lightOn = (y != A);
	
endmodule
		
module Top(output enL, output exL, output lit);
reg clk;
reg rst;
always
	#1 clk=~clk;
	
initial
	begin
		clk=1'b0;
		rst=1'b1;
		#4
		rst=1'b0;
		#512
		$stop;
	end
	
	reg [3:0] lfsr4;
	always@(posedge clk)
		if(rst)
			lfsr4<=4'b0001;
			else
				begin
					lfsr4[3]<=lfsr4[2];
					lfsr4[2]<=lfsr4[1];
					lfsr4[1]<=lfsr4[0]^lfsr4[3];
					lfsr4[0]<=lfsr4[3];
				end
				
entryControl NQ(clk, rst, (lfsr4[3]|lfsr4[2])&(enL),(lfsr4[1]|lfsr4[0])&lit, enL, exL, lit);
endmodule


