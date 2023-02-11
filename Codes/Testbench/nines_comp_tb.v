// 9's complementer test bench

`timescale 1ns/1ns
`include "nines_comp.v"

module nines_comp_tb;
    reg [3:0] B;
    reg M;              // M is for Mode Select
    wire [3:0] Bcomp;

    nines_comp uut (.B(B),.M(M),.Bcomp(Bcomp));  // Instantiate the Unit Under Test

initial begin
        $dumpfile("nines_comp_tb.vcd");
        $dumpvars(0,nines_comp_tb);

    B=0000;M=1;
    #2 B=0001;M=1;
    #2 B=0010;M=1;
    #2 B=0011;M=1;
    #2 B=0100;M=1;
    #2 B=0101;M=1;
    #2 B=0110;M=1;
    #2 B=0111;M=1;
    #2 B=1000;M=1;
    #2 B=1001;M=1;
    #2 B=1001;M=0;
    #2;
    $display("Test Complete");
end

initial $monitor($time,"\t M=%b, B=%b, Bcomp=%b",M,B,Bcomp);

endmodule