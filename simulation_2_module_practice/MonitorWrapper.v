`timescale 1ns/100ps
module MonitorWrapper(); // HAS NO PORTS

       wire [1:0] A;
       wire [1:0] B;
       wire Cin;
       

       wire [1:0] SumTop;
       wire CoutTop;
       wire [1:0] SumG;
       wire CoutG;
       wire [1:0] SumNQR;
       wire CoutNQR;

       Tester myTester(A,B,Cin);
       
       Top myTop(A,B,Cin,SumTop,CoutTop);

       Golden myGolden(A,B,Cin,SumG,CoutG);       

       Taupe notQuiteRight(A,B,Cin,SumNQR,CoutNQR);

       initial
	begin
		 $monitor("|<%b> -> <%b>| %h + %h + %h = | Golden: %h | Top: %h | Taupe %h |",{A,B,Cin},{CoutNQR,SumNQR},A,B,Cin,{CoutG,SumG},{CoutTop,SumTop},{CoutNQR,SumNQR}); 
	end

endmodule

