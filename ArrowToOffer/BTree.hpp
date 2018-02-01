//
//  BTree.hpp
//  ArrowToOffer
//
//  Created by xiaochen yang on 2018/2/1.
//  Copyright © 2018年 xiaochen yang. All rights reserved.
//

#ifndef BTree_hpp
#define BTree_hpp

#include <stdio.h>

struct BTreeNode {
    int data;
    BTreeNode *left, *right;
};

class BTree {
public:
    void setRoot(BTreeNode *r) {
        root = r;
    }
protected:
    void inOrder(BTreeNode *root);
    void preOrder(BTreeNode *root);
    void postOrder(BTreeNode *root);
    int BTreeSize(BTreeNode *root);
    int BTreeLeaves(BTreeNode *root);
    int BTreeHeight(BTreeNode *root);
    
private:
    BTreeNode *root;
};

#endif /* BTree_hpp */
