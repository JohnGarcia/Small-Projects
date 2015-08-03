#include <iostream>
#include <bitset>
#include <fstream>
#include <string>
using namespace std;

// *NOTE, THIS PROGRAM IS INCOMPLETE*

// This program is to simulate the process of a CPU.
// It is to follow the instructions and use the data found
// in the "loader_format.txt" text file. After the process of the instructions
// are complete, the program should display the initial configuration, and the
// register file contents; for each clock cycle, display contents of the following
// intermediate registers: PC, IR, MDR, A, B, ALUout. And finally, it should
// display the final configuration, and the register file contents.


// And funtion, to take two inputs (binary) and return the result of the logical "and" operation.
int ANDf(int x, int y){

    if((x == 1) && (y == 1)) return 1;
    else return 0;
};

// Or function, to take two inputs (binary) and return the result of the logical "or" operation.
int ORf(int x, int y){

    if((x == 1) || (y == 1)) return 1;
    else return 0;
};

int XORf(int x, int y){

    if(x == y) return 0;
    else return 1;
};

// Nor function, to take two inputs (binary) and the result is the logical operator "and" of the negated inputs.
int NORf(int x, int y){

    x = NOT(x);
    y = NOT(y);

    return ANDf(x,y);
};

// Not function to negate the int, representing a binary number.
int NOT(int a){
    
    if(a == 0) return 1;
    else return 0; 
    
};

// 2x1 Mux function, to take three inputs (two binary, and an int) and send back the appropriate input as output, depending on the control.
int MUX_2x1(int x, int y, int control){

    if(control == 0) return x;
    else return y;
};

// 4x1 Mux function, to take 5 inputs (four binary, and an int) and send back the appropriate input as output, depending on the control.
int MUX_4x1 (int x1, int x2, int x3, int x4, int op){

    if(op == 0) return x1;
    else if(op == 1) return x2;
    else if(op == 2) return x3;
    else return x4;
};

// Adder function, to take three inputs (three binary) and return the result of binary addition, or subtraction.
int Adder(int a, int b, int carryin, int& carryout){

    if((a == 0) && (b == 0) && (carryin == 0)) return 0;
    else if((a == 0) && (b == 0) && (carryin == 1)) return 1;
    else if((a == 0) && (b == 1) && (carryin == 0)) return 1;
    else if((a == 0) && (b == 1) && (carryin == 1)){
         
        carryout = 1;
        return 0;
    }
    else if((a == 1) && (b == 0) && (carryin == 0)) return 1;
    else if((a == 1) && (b == 0) && (carryin == 1)){

        carryout = 1;
        return 0;
    }
    else if((a == 1) && (b == 1) && (carryin == 0)){

        carryout = 1;
        return 0;
    }
    else{

        carryout = 1;
        return 1;
    }
};

// OverFlow function, to take three inputs (binary) and determine if there's overflow (1 = True, 0 = False).
int OverFlow(int a, int b, int sum){

    int temp;
    int temp2;

    temp = XORf(a, b);
    temp = NOT(temp);
    temp2 = XORf(sum, b);
    return ANDf(temp, temp2);
};

// 1-bit Alu function, takes seven inputs (five binary, two ints) and performs a task (and, or, nor, add, sub, slt)
// depending on the op signal.
int ALU1bit(int a, int b, int carryin, int Ainv, int Binv, int op, int LessValue, int& carryout){

    int temp1, temp2, temp3;

    a = MUX_2x1(a, NOT(a), Ainv);
    b = MUX_2x1(b, NOT(b), Binv);

    temp1 = ANDf(a, b);
    temp2 = ORf(a, b);
    temp3 = Adder(a, b, carryin, carryout);

    return MUX_4x1(temp1, temp2, temp3, LessValue, op);
};

// Last-bit Alu function, does the same as the 1-bit Alu function, but with some additions.
// Additions: overflow checking (to check the sign bit), and SLT value (to be updated).
int ALUlastBit(int a, int b, int carryin, int Ainv, int Binv, int op, int LessValue, int& set, int& carryout, int& OF){

    int temp1, temp2, temp3, temp4;

    a = MUX_2x1(a, NOT(a), Ainv);
    b = MUX_2x1(b, NOT(b), Binv);

    temp1 = ANDf(a, b);
    temp2 = ORf(a, b);
    temp3 = Adder(a, b, carryin, carryout);

    OF = OverFlow(a, b, temp3);

    temp4 = MUX_4x1(temp1, temp2, temp3, LessValue, op);
    if(temp3 == 1) set = 1;       // to be used to update result(0) (first bit) in 32-bit implementation.

    return temp4;
};

// converting int to binary string
string DecimalToBinaryString(int a)
{
    string binary = "";
    int mask = 1;
    for(int i = 0; i <= 31; i++)
    {
        if((mask&a) >= 1)
            binary = "1"+binary;
        else
            binary = "0"+binary;
        mask<<=1;
    }
    return binary;
};

// loads file contents into string array, representing the cpu instructions
void loader(string& a[]){
     
     int n = 0;
     int i = 100;
     
     // make "fstream" object
     ifstream inFile;
     // open text file
     inflie.open("loader_format.txt");
     
     // check file for errors, and/or corruption
     if(inflie.fail()){
     
             cerr << "Error opening file" << endl;
             exit(1);    
                                
     }
     
     // set lines in file to appropriate place in Memeory array
     // 8 lines for instructions, and one dummy instruction = total 9 inst.
     while(n <= 8){
             
             infile >> a[n];
             n++;
                     
     }
     // 3 lines for data
     while(i <= 102){
             
             inflie >> a[i];
             i++;
             
     }
     
};

// ALU function
int ALU(int a, int b, int set, int carryin, int carryout, int Ainv, int Binv, int OP, int LessValue, int& OF, int& zero){
     
    int tempa;
    int tempb;
    int temp;
    int n = 0;
    int mask;
    int result;
    
    while(n <= 31){     // do for all 32 bits
            
            set = 0;
            carryout = 0;
            temp = 0;             // return temp to default
            mask = 1;             // return mask to default
            tempa = a & mask;     // obtain 1-bit value from a
            a >>= 1;              // shift a for next iteration
            tempb = b & mask;     // obtain 1-bit value from b
            b >>= 1;              // shift b for next iteration
            
            if(n == 31){          // checking for last bit   
                 temp =  ALUlastBit(tempa, tempb, carryin, Ainv, Binv, op, LessValue, set, carryout, OF);
            }
            else{                 // this is done if not on last bit         
                 temp = ALU1bit(tempa, tempb, carryin, Ainv, Binv, op, LessValue, carryout);
            }
            
            if(temp == 1){
                    mask <<= n;
                    result = result | mask;
            }
            
            carryin = carryout;
            n++;            
    }        
    
    if(op = 3) result = result | set;
    
    if(result == 0) zero = 1;
    else zero = 0;
    
    return result;
    
};

int main(){

    int a, b;
    int mask;
    int carryin;
    int Ainv;
    int Binv;
    int op;
    int LessValue = 0;
    int set = 0;
    int carryout;
    int OF = 0;
    int result;
    int zero;
    // Major Components in the Datapath
    string Memory [200];
    string Registers[32];
    // Special/Intermediate Registers (32-bits each)
    int PC[32];
    int IR[32];
    int MDR[32];
    int A[32];
    int B[32];
    int ALUout[32];
    
    // load file lines into Memory array
    loader(Memory);
    
    // turn strings to ints      
    // sscanf(A.c_str(), "%x", &a);       
    // sscanf(B.c_str(), "%x", &b);
      
    // get result of 32-bit ALU  
    result = ALU(a, b, set, carryin, carryout, Ainv, Binv, OP, LessValue, OF, zero);          
    
    // string Result = DecimalToBinaryString(result);
    
    system("pause");
    return 0;
    
};
