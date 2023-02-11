// BCD Subtractor

module bcd_sub(A,B,Cin,Diff,Bout);
input [3:0] A,B;                            // A & B are in BCD form
input Cin;
output [3:0] Diff;
output Bout;
wire [3:0] Bcomp,Sbfa,BCD_adding;
wire C1,C2,Cin2,M;
assign M=1;
nines_comp compB0 (B,M,Bcomp);          /* Considering A>=B>=0 as mentioned in question,
                                                so performing A-B operation, that's why B complemented */
FA4bit fa0 (A,Bcomp,Cin,Sbfa,C1);
assign Bout = (Sbfa[3] & Sbfa[2]) | (Sbfa[3] & Sbfa[1]) | C1;
assign BCD_adding = 4'b0110;             // 0110 for BCD addition
assign Cin2=1;
FA4bit fa1 (Sbfa,BCD_adding,Cin2,Diff,C2);
endmodule