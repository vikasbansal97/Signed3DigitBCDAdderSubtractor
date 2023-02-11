// 4 bit Comparator Behavioral Test Bench

`timescale 1ns / 1ns
`include "comparator_behav.v"

module comparator_behav_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire less;
    wire equal;
    wire greater;

    comparator_behav uut (.A(A),.B(B),.less(less),.equal(equal),.greater(greater)); // Instantiate the Unit Under Test (UUT)
    initial begin
        $dumpfile("comparator_behav_tb.vcd");
        $dumpvars(0,comparator_behav_tb);
        // $dumplimit(5mb); //TO Set .vcd file size limit

        //Apply some inputs for testing
        A = 1;
        B = 7;
        #10;
        A = 5;
        B = 2;
        #10;
        A = 8;
        B = 8;
        #10;
    end 
    initial $monitor($time,"\t x3=%b, x2=%b, x1=%b, x0=%b, y3=%b, y2=%b, y1=%b, y0=%b, L=%b, E=%b, G=%b ", A[3],A[2],A[1],A[0],B[3],B[2],B[1],B[0],less,equal,greater);
   
endmodule