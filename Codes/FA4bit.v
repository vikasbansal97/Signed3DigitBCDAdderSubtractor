// 4 bit Binary Adder module

module FA4bit(A,B,Cin,S,Cout);
input [3:0] A,B;
input Cin;
output [3:0] S;
output Cout;
FA fa0 (A[0],B[0],Cin,S[0],C1);
FA fa1 (A[1],B[1],C1,S[1],C2);
FA fa2 (A[2],B[2],C2,S[2],C3);
FA fa3 (A[3],B[3],C3,S[3],Cout);
endmodule