// 12 bit Magnitude Comparator Test Bench

`timescale 1ns / 1ns
`include "comparator_behav.v"
`include "comparator_12bit_behav.v"


module comparator_12bit_behav_tb;

    // Inputs
    reg [3:0] A2,A1,A0;
    reg [3:0] B2,B1,B0;

    // Outputs
    wire L,E,G;

    // Instantiate the Unit Under Test (UUT)
    comparator_12bit_behav uut (.A2(A2),.A1(A1),.A0(A0),.B2(B2),.B1(B1),.B0(B0),.L(L),.E(E),.G(G));
    initial begin
        $dumpfile("comparator_12bit_behav_tb.vcd");
        $dumpvars(0,comparator_12bit_behav_tb);
        // $dumplimit(5mb); //TO Set .vcd file size limit

        //Apply some inputs for testing
        A2 = 4'h8; A1 = 4'h2; A0 = 4'h6; B2 = 4'h7; B1 = 4'h4; B0 = 4'h9;
        # 100  A2 = 4'h1; A1 = 4'h2; A0 = 4'h6; B2 = 4'h7; B1 = 4'h4; B0 = 4'h9;
        # 100  A2 = 4'h1; A1 = 4'h2; A0 = 4'h6; B2 = 4'h1; B1 = 4'h2; B0 = 4'h6;
        #100;
    end
    
    initial $monitor($time,"\t A2=%h, A1=%h, A0=%h, B2=%h, B1=%h, B0=%h, L=%b, E=%b, G=%b ",A2,A1,A0,B2,B1,B0,L,E,G);

endmodule