// BCD Adder with LED test bench

`timescale 1ns/1ns
`include "bcd_add_LED.v"
`include "FA4bit.v"
`include "FA.v"
`include "sevenSegmentDisplayBehavorial.v"

module bcd_add_LED_tb;
    reg [3:0] A,B;          // A & B are in BCD form
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    wire x1,y1,c1,d1,e1,f1,g1,x2,y2,c2,d2,e2,f2,g2;

    // Instantiate the Unit Under Test
    bcd_add_LED uut (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout),.x1(x1),.y1(y1),.c1(c1),.d1(d1),.e1(e1),.f1(f1),.g1(g1),.x2(x2),.y2(y2),.c2(c2),.d2(d2),.e2(e2),.f2(f2),.g2(g2)); 

initial begin
        $dumpfile("bcd_add_LED_tb.vcd");
        $dumpvars(0,bcd_add_LED_tb);

    // Applying the inputs for testing covering all cases
    
    A=4'b0000;B=4'b0000;Cin=0;                // Case of valid BCD generating Sum=0000 & Cout=0
    #2 A=4'b0001;B=4'b1000;Cin=0;             // Case of valid BCD, so Cout=0
    #2 A=4'b0111;B=4'b0111;Cin=0;             // Case of invalid BCD, so Cout=1
    #2 A=4'b1000;B=4'b1001;Cin=0;             // Case of valid BCD but carry out generation, so Cout=1
    #2 A=4'b1001;B=4'b0111;Cin=0;             /* Case of both invalid BCD & carry out generation not possible
                                                for two BCD numbers (A & B) sum */
    #2;
    $display("Test Complete");
end

initial $monitor($time,"\t A=%b, B=%b, Sum=%b, Cout=%b\n x1=%b, y1=%b, c1=%b, d1=%b, e1=%b, f1=%b, g1=%b \n x2=%b, y2=%b, c2=%b, d2=%b, e2=%b, f2=%b, g2=%b\n ",A,B,Sum,Cout,x1,y1,c1,d1,e1,f1,g1,x2,y2,c2,d2,e2,f2,g2);

endmodule