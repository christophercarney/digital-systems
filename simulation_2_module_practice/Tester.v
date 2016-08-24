`timescale 1ns/100ps
module Tester (tvA, tvB, tvCin);
  output reg [1:0] tvA;
  output reg [1:0] tvB;
  output reg tvCin;
  
  initial
    begin
    #0 // wait 0 time units, then:
    force tvA=2'b00;  
    force tvB=2'b01;
    force tvCin=1'b1;
    #3 // wait 3 time units, then:
    force tvA=2'b11;  
    force tvB=2'b10;
    force tvCin=1'b0;
    #2 // wait 2 time units, then:

    force tvA=2'b00; force tvB=2'b00; force tvCin=1'b0;
    #2 
    force tvA=2'b00; force tvB=2'b11; force tvCin=1'b0;
    #2 
    force tvA=2'b00; force tvB=2'b01; force tvCin=1'b0;
    #2 
    force tvA=2'b00; force tvB=2'b00; force tvCin=1'b1;
    #2 
    force tvA=2'b00; force tvB=2'b10; force tvCin=1'b0;
    #2 
    force tvA=2'b00; force tvB=2'b10; force tvCin=1'b1;
    #2 
    force tvA=2'b01; force tvB=2'b00; force tvCin=1'b0;
    #2 
    force tvA=2'b00; force tvB=2'b11; force tvCin=1'b1;
    #2 
    force tvA=2'b01; force tvB=2'b00; force tvCin=1'b1;
    #2 
    force tvA=2'b01; force tvB=2'b01; force tvCin=1'b0;
    #2 
    force tvA=2'b01; force tvB=2'b10; force tvCin=1'b0;
    #2 
    force tvA=2'b01; force tvB=2'b01; force tvCin=1'b1;
    #2 
    force tvA=2'b01; force tvB=2'b10; force tvCin=1'b1;
    #2 
    force tvA=2'b10; force tvB=2'b01; force tvCin=1'b0;
    #2 
    force tvA=2'b10; force tvB=2'b11; force tvCin=1'b1;
    #2 
    force tvA=2'b10; force tvB=2'b11; force tvCin=1'b1;	//incorrect case for taupe
    #2 
    force tvA=2'b11; force tvB=2'b11; force tvCin=1'b0;
    #2 
    force tvA=2'b11; force tvB=2'b10; force tvCin=1'b1;
    #2 
    force tvA=2'b11; force tvB=2'b11; force tvCin=1'b1;
    #2 
    force tvA=2'b01; force tvB=2'b11; force tvCin=1'b0;
    #2 
    force tvA=2'b10; force tvB=2'b01; force tvCin=1'b1;
    #2 
    force tvA=2'b10; force tvB=2'b10; force tvCin=1'b0;
    #2 
    force tvA=2'b10; force tvB=2'b10; force tvCin=1'b1;
    #2 
    force tvA=2'b10; force tvB=2'b00; force tvCin=1'b0;
    #2 
    force tvA=2'b11; force tvB=2'b00; force tvCin=1'b1;
    #2 
    force tvA=2'b11; force tvB=2'b01; force tvCin=1'b1;
    #2 
    force tvA=2'b01; force tvB=2'b11; force tvCin=1'b1;
    #2 
    force tvA=2'b10; force tvB=2'b00; force tvCin=1'b0;
    #2 
    force tvA=2'b10; force tvB=2'b00; force tvCin=1'b1;
    #2 
    force tvA=2'b11; force tvB=2'b01; force tvCin=1'b0;
    #2 
    
    #10 // wait 10 time units, then:
    $stop; // end simulation, do not quit
    end


   /* 
	Q1: Because taupe uses case statements the only way to check for any errors is to test every case.
	Since we know golden is always correct we can compare the waveforms to see where top/taupe doesn't match golden.
	After running the testbench above we see that top always matches golden and that taupe is wrong when A=10, B=11, C=1.

	Q2: Currently we need to check the waveform of each module against golden to see if it is correct. We could do
	this automatically by using 'if' statements to compare the output of each module to golden's output and if they don't
	match then output some kind of error message.
   */
endmodule