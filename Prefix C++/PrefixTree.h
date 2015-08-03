#ifndef PREFIXTREE_H
#define PREFIXTREE_H
class PrefixTree
{
    private:

        struct node
        {
            std::string key;
            node* left;
            node* right;
        };

        node* root;
        node* current;
        node* parent;

        node* NewLeaf(std::string key);
        node* BuildPrivate(std::queue<std::string> &list);
        void evaluatePrivate(node* pointer);
        void traversePrivate(node* pointer);

    public:

        PrefixTree();
        void Build(std::queue<std::string> list);
        void evaluate(node* pointer);
        void traverse();
        bool isOP(std::string key);
        void printRoot();
};

#endif
