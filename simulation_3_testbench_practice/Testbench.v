module Testbench (output [7:0] errCount);

  wire [3:0] tCases;
  wire [5:0] tCaseOuts;

  reg vClk;
  reg reset;

  driver VinDiesel(reset,vClk,tCases);
  Braille HK(tCases,tCaseOuts);
  checker Grocery(reset,tCaseOuts, tCases, vClk, errCount);

// Non-Synthesizble portions of the testbench BEGIN
  initial
  begin
    vClk<=1'b0;
    reset<=1'b1;
    #4 
    reset<=1'b0;
    #16
    $stop;
  end

  always
    #1 vClk=~vClk;

// Non-Synthesizable portions END
endmodule

module driver(
  input reset,
  input vClock,
  output [3:0] testCases
);

  reg [2:0] curCase;

  always@(posedge vClock)
    if (reset)
  	  curCase=3'b000;
    else
 	  curCase <= curCase+1;

  assign testCases = {curCase,1'b0};

endmodule

module checker(
  input reset,
  input [5:0] testOut,
  input [3:0] testIn,
  input vClock,
  output reg [7:0] errCount
);

wire curError;
wire icor0;
wire icor1;
wire icor2;
wire icor3;
wire icor4;
wire icor5;

assign icor0=(~testOut[0])^((~(|testIn))|(testIn[3]&testIn!=8));
assign icor1=(~testOut[1])^((testIn==1)|(testIn==2)|(testIn==5)|(testIn==8)|(testIn>9));
assign icor2=(~testOut[2])^((testIn==1)|(testIn==3)|(testIn==4)|(testIn==5)|(testIn>9));
assign icor3=(~testOut[3])^((testIn==1)|(testIn==2)|(testIn==3)|(testIn==6)|(testIn>8));
assign icor4=(~testOut[4])^((~(|testIn))|(|testIn));
assign icor5=(~testOut[5])^((~(|testIn))|(|testIn));

assign curError=|{icor0,icor1,icor2,icor3,icor4,icor5};

always@ (posedge vClock)
  if(reset)
    errCount=8'b0000_0000;
  else
	errCount<=errCount+curError;

endmodule