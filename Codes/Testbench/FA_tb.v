// Full Adder test bench
`timescale 1ns/1ns
`include "FA.v"

module FA_tb;
    reg A,B,Cin;
    wire S,Cout;

    FA uut (.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout));  // Instantiate the Unit Under Test

initial begin
        $dumpfile("FA_tb.vcd");
        $dumpvars(0,FA_tb);

    A=0;B=0;Cin=0;
    #2 A=0;B=0;Cin=1;
    #2 A=0;B=1;Cin=0;
    #2 A=0;B=1;Cin=1;
    #2 A=1;B=0;Cin=0;
    #2 A=1;B=0;Cin=1;
    #2 A=1;B=1;Cin=0;
    #2 A=1;B=1;Cin=1;
    #2;
    $display("Test Complete");
end

initial $monitor($time,"\t A=%b, B=%b, Cin=%b, S=%b, Cout=%b",A,B,Cin,S,Cout);

endmodule