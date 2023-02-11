// BCD Subtractor test bench

`timescale 1ns/1ns
`include "bcd_sub.v"
`include "nines_comp.v"
`include "bcd_add.v"
`include "FA4bit.v"
`include "FA.v"

module bcd_sub_tb;
    reg [3:0] A,B;          // A & B are in BCD form
    reg Cin;
    wire [3:0] Diff;
    wire Bout;

    bcd_sub uut (.A(A),.B(B),.Cin(Cin),.Diff(Diff),.Bout(Bout));  // Instantiate the Unit Under Test

initial begin
        $dumpfile("bcd_sub_tb.vcd");
        $dumpvars(0,bcd_sub_tb);

    // Applying the inputs for testing covering all cases, taking A>=B>=0 as mentioned in question

    A=4'b0000;B=4'b0000;Cin=0;                // Case when both A & B are 0

    #2 A=4'b1000;B=4'b1000;Cin=0;             /* Case of A=B generating diff=0 and this 
                                                case always give valid BCD, so Bout=0 also*/

    #2 A=4'b0101;B=4'b0100;Cin=0;             // Case of invalid BCD, so Bout=1

    #2 A=4'b1001;B=4'b0010;Cin=0;             // Case of valid BCD but carry out generation, so Bout=1
                
    #2;                                       /* Case of both invalid BCD & carry out generation not possible */
    $display("Test Complete");
end

initial $monitor($time,"\t A=%b, B=%b, Diff=%b, Bout=%b",A,B,Diff,Bout);

endmodule