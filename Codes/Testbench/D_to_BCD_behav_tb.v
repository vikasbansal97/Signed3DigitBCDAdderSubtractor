// Decimal to BCD Test Bench

`timescale 1ns / 1ns
`include "D_to_BCD_behav.v"

module D_to_BCD_behav_tb;
    integer t;

    // Inputs
    reg[9:0]i;
    reg en;

    // Outputs
    wire[3:0]y;

    D_to_BCD_behav uut (.i(i),.en(en),.y(y)); //Instantiate the unit under test (UUT)

initial 
    begin
        $dumpfile("D_to_BCD_behav_tb.vcd");
        $dumpvars(0,D_to_BCD_behav_tb);
        // $dumplimit(5mb);      //TO Set .vcd file size limit

    en=1;
    for (t=0;t<10;t=t+1)
        begin 
            i[t] = 1'b1;
            #5;
        end
    end
    initial $monitor($time,"\ti0=%b, i1=%b, i2=%b, i3=%b, i4=%b, i5=%b, i6=%b, i7=%b, i8=%b, i9=%b, y3=%b, y2=%b, y1=%b, y0=%b", i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7],i[8],i[9],y[3],y[2],y[1],y[0]);
endmodule