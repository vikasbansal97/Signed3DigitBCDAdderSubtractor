// // 12 bit Magnitude Comparator Behavioral

module comparator_12bit_behav(A2,A1,A0,B2,B1,B0,L,E,G);    
input [3:0] A2,A1,A0;
input [3:0] B2,B1,B0;

output L,E,G;

wire L0,L1,L2,E0,E1,E2,G0,G1,G2;

comparator_behav comp1 (A2,B2,L2,E2,G2);
comparator_behav comp2 (A1,B1,L1,E1,G1);
comparator_behav comp3 (A0,B0,L0,E0,G0);

assign G = G2 | (E2 & G1) | (E2 & E1 & G0);

assign E = E2 & E1 & E0;

assign L = L2 | (E2 & L1) | (E2 & E1 & L0);

endmodule