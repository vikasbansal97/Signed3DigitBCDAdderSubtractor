// Decimal to BCD Behavioral coding

module D_to_BCD_behav(i,en,y);
    
    // Inputs
    input en;
    input [9:0] i;

    // Outputs
    output reg [3:0] y;  //Output should be register data type in behavioral

    always @ (en,i)
        begin
            if(en==0)
                y=4'b0000;
            else
                case (i)
                    10'b0000000001: y=4'b0000;
                    10'b0000000010: y=4'b0001;
                    10'b0000000100: y=4'b0010;
                    10'b0000001000: y=4'b0011;
                    10'b0000010000: y=4'b0100;
                    10'b0000100000: y=4'b0101;
                    10'b0001000000: y=4'b0110;
                    10'b0010000000: y=4'b0111;
                    10'b0100000000: y=4'b1000;
                    10'b1000000000: y=4'b1001;
                    default: y=4'b0000;
                endcase
        end
        initial $monitor($time,"\ti0=%b, i1=%b, i2=%b, i3=%b, i4=%b, i5=%b, i6=%b, i7=%b, i8=%b, i9=%b, y3=%b, y2=%b, y1=%b, y0=%b", i[0],i[1],i[2],i[3],i[4],i[5],i[6],i[7],i[8],i[9],y[3],y[2],y[1],y[0]);

endmodule
