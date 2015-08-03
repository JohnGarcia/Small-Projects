#include<iostream>
#include<cstdlib>
#include<stdio.h>
#include<string.h>
#include<sstream>
#include<queue>
#include "PrefixTree.cpp"

using namespace std;

int main ()
{
    PrefixTree test; //Tree object
    queue<string> qos; //Queue to store string tokens

    std::string s = "/ + 4 10 * 2 3"; //Test Prefix Expression string
    std::string delimiter = " ";

    size_t pos = 0; //Position
    std::string token;
    while ((pos = s.find(delimiter)) != std::string::npos) //Loop through string s, until the end of string s
    {
        token = s.substr(0, pos);
        qos.push(token);
        s.erase(0, pos + delimiter.length());
    }
    qos.push(s); //One token left in s at the end of loop, push to queue

    //Begin Prefix Tree Creation and Evaluation
    test.Build(qos);
    test.traverse();
    cout<<"\n";
    test.printRoot(); //Print Result

    return 0;
}
