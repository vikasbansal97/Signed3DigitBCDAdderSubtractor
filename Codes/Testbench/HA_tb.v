// Half Adder test bench
`timescale 1ns/1ns
`include "HA.v"

module HA_tb;
    reg A,B;
    wire S,Cout;

    HA uut (.A(A),.B(B),.S(S),.Cout(Cout));  // Instantiate the Unit Under Test

initial begin
        $dumpfile("HA_tb.vcd");
        $dumpvars(0,HA_tb);

    A=0;B=0;
    #2 A=0;B=1;
    #2 A=1;B=0;
    #2 A=1;B=1;
    #2;
    $display("Test Complete");
end

initial $monitor($time,"\t A=%b, B=%b, S=%b, Cout=%b",A,B,S,Cout);

endmodule