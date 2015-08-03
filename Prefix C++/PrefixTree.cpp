#include<cstdlib>
#include<string.h>
#include<sstream>
#include<queue>
#include "PrefixTree.h"
using namespace std;

PrefixTree::PrefixTree()
{
    root = NULL;
}

//Create a new Node
PrefixTree::node* PrefixTree::NewLeaf(string key)
{
    node* New = new node;
    New->key = key;
    New->left = NULL;
    New->right = NULL;
    return New;
}

void PrefixTree::Build(queue<string> list)
{
        BuildPrivate(list);
}

//Build Prefix Expression Tree
PrefixTree::node* PrefixTree::BuildPrivate(queue<string> &list)
{
    string next = list.front(); //Get next item from queue
    list.pop(); //Remove item from queue
    PrefixTree::node* temp; //Used to return complete node

    if(root == NULL) //Check if Root is NULL (if tree has begun creation)
    {
        root = NewLeaf(next);
        root->left = BuildPrivate(list);
        root->right = BuildPrivate(list);
        return root;
    }
    else if(isOP(next)) //If Item in queue is an Operand
    {
        temp = NewLeaf(next);
        temp->left = BuildPrivate(list);
        temp->right = BuildPrivate(list);
        return temp;
    }
    else return NewLeaf(next); //If Item in queue is a Number
}

void PrefixTree::evaluate(node* pointer)
{
    evaluatePrivate(pointer);
}

//Evaluate the Operand (pointer's key) using its children (who should be numbers)
//Then replace Operand (pointer's key) with result
//FYI should only be called on a node with the key being an Operand
void PrefixTree::evaluatePrivate(node* pointer)
{
    double temp1, temp2, temp3;
    std::stringstream ss;
    if(pointer->key.compare("+") == 0) //If Operand is a + sign
    {
        temp1 = atof(pointer->left->key.c_str()); //Turn left child into double type (float)
        temp2 = atof(pointer->right->key.c_str()); //Turn right child into double type (float)
        temp3 = temp1 + temp2;
        ss << temp3; //Turn back into string
        ss >> pointer->key;
    }
    else if(pointer->key.compare("*") == 0) //If Operand is a * sign
    {
        temp1 = atof(pointer->left->key.c_str()); //Turn left child into double type (float)
        temp2 = atof(pointer->right->key.c_str()); //Turn right child into double type (float)
        temp3 = temp1 * temp2;
        ss << temp3; //Turn back into string
        ss >> pointer->key;
    }
    else if(pointer->key.compare("/") == 0) //If Operand is a / sign
    {
        temp1 = atof(pointer->left->key.c_str()); //Turn left child into double type (float)
        temp2 = atof(pointer->right->key.c_str()); //Turn right child into double type (float)
        temp3 = temp1 / temp2;
        ss << temp3; //Turn back into string
        ss >> pointer->key;
    }
    else
    {
        cout<<"Error! \n";
        cout<<"Key does not match possible expressions. \n";
    }
}

void PrefixTree::traverse()
{
    traversePrivate(root);
}

void PrefixTree::traversePrivate(node* pointer)
{
    if(root != NULL)
    {
        cout<<pointer->key<<" "; //pre order: Traverse the root, left sub-tree, right sub-tree
        if(pointer->left != NULL)
        {
            traversePrivate(pointer->left);
        }
        //cout<<pointer->key<<" "; //in order: Traverse the left sub-tree, root, right sub-tree
        if(pointer->right != NULL)
        {
            traversePrivate(pointer->right);
        }
        //cout<<pointer->key<<" "; //post order: Traverse left sub-tree, right sub-tree, root

        if(isOP(pointer->key)) evaluate(pointer); //Evaluation of Tree
    }
    else
    {
        cout<<"Empty Tree. \n";
    }
}

//check if input is an accepted operand (/ * +)
bool PrefixTree::isOP(string key)
{
    return (key.compare("+") == 0 || key.compare("*") == 0 || key.compare("/") == 0);
}

//Print Root's key (which should be the result after the traversal)
void PrefixTree::printRoot()
{
    cout<<"The result is "<<root->key<<".";
}
