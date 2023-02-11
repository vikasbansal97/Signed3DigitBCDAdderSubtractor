// BCD Adder test bench

`timescale 1ns/1ns
`include "bcd_add.v"
`include "FA4bit.v"
`include "FA.v"

module bcd_add_tb;
    reg [3:0] A,B;          // A & B are in BCD form
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    bcd_add uut (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));  // Instantiate the Unit Under Test

initial begin
        $dumpfile("bcd_add_tb.vcd");
        $dumpvars(0,bcd_add_tb);

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

initial $monitor($time,"\t A=%b, B=%b, Sum=%b, Cout=%b",A,B,Sum,Cout);

endmodule