module Braille(
input [3:0] BCDin,
output reg [5:0] BrailleOut
);

always@(*)
  case(BCDin)
    4'b0000:BrailleOut = 6'b001110;
	 4'b0001:BrailleOut = 6'b000001;
	 4'b0010:BrailleOut = 6'b000101;
	 4'b0011:BrailleOut = 6'b000011;
    4'b0100:BrailleOut = 6'b001011;
	 4'b0101:BrailleOut = 6'b001001;
	 4'b0110:BrailleOut = 6'b000111;
	 4'b0111:BrailleOut = 6'b001111;
    4'b1000:BrailleOut = 6'b001101;
	 4'b1001:BrailleOut = 6'b000110;
	 default: BrailleOut = 6'b000000;
	endcase
	
endmodule

/*
Info: *******************************************************************
Info: Running Quartus II 64-Bit Analysis & Synthesis
	Info: Version 15.0.0 Build 145 04/22/2015 SJ Web Edition
	Info: Processing started: Tue Sep 29 20:51:10 2015
Info: Command: quartus_map --read_settings_files=on --write_settings_files=off Lab3 -c Braille
Warning (20028): Parallel compilation is not licensed and has been disabled
Info (12021): Found 1 design units, including 1 entities, in source file braille.v
	Info (12023): Found entity 1: Braille
Info (12127): Elaborating entity "Braille" for the top level hierarchy
Warning (13024): Output pins are stuck at VCC or GND
	Warning (13410): Pin "BrailleOut[4]" is stuck at GND
	Warning (13410): Pin "BrailleOut[5]" is stuck at GND
Info (286030): Timing-Driven Synthesis is running
Info (16010): Generating hard_block partition "hard_block:auto_generated_inst"
	Info (16011): Adding 0 node(s), including 0 DDIO, 0 PLL, 0 transceiver and 0 LCELL
Info (21057): Implemented 14 device resources after synthesis - the final resource count might be different
	Info (21058): Implemented 4 input pins
	Info (21059): Implemented 6 output pins
	Info (21061): Implemented 4 logic cells
Info: Quartus II 64-Bit Analysis & Synthesis was successful. 0 errors, 4 warnings
	Info: Peak virtual memory: 708 megabytes
	Info: Processing ended: Tue Sep 29 20:51:34 2015
	Info: Elapsed time: 00:00:24
	Info: Total CPU time (on all processors): 00:00:58
*/