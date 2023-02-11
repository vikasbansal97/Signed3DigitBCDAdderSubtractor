// 4 bit Comparator Behavioral coding

module comparator_behav(A,B,less,equal,greater);

    // Inputs
    input [3:0] A;
    input [3:0] B;

    // Outputs
    output less;
    output equal;
    output greater;

    //Internal variables
    reg less;
    reg equal;
    reg greater;

    //When the inputs and A or B are changed execute this block
    always @(A or B)
     begin
        if(A > B)   begin         //check if A is bigger than B.
            less = 0;
            equal = 0;
            greater = 1;    end
        else if(A == B) begin     //Check if A is equal to B
            less = 0;
            equal = 1;
            greater = 0;    end
        else    begin             //Otherwise - check A is less than B.
            less = 1;
            equal = 0;
            greater =0;
        end 
    end
endmodule