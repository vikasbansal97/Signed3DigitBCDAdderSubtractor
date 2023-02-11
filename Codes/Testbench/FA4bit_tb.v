// 4 bit Binary Adder test bench

`timescale 1ns/1ns
`include "FA4bit.v"
`include "FA.v"

module FA4bit_tb;
    reg [3:0] A,B;
    reg Cin;
    wire [3:0] S;
    wire Cout;

    FA4bit uut (.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout));  // Instantiate the Unit Under Test

initial begin
        $dumpfile("FA4bit_tb.vcd");
        $dumpvars(0,FA4bit_tb);

    A=0000;B=0000;Cin=0;
    #2 A=0001;B=0010;Cin=0;
    #2 A=1000;B=0001;Cin=0;
    #2 A=0111;B=0110;Cin=0;
    #2 A=1000;B=1000;Cin=0;
    #2 A=1111;B=1111;Cin=0;
    #2;
    $display("Test Complete");
end

initial $monitor($time,"\t A=%b, B=%b, S=%b, Cout=%b",A,B,S,Cout);

endmodule