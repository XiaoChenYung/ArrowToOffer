//
//  BinaryTreeNode.m
//  ArrowToOffer
//
//  Created by xiaochen yang on 2018/1/17.
//  Copyright © 2018年 xiaochen yang. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

+ (NSInteger)numberNodeOfTree:(BinaryTreeNode *)root {
    if (root == nil) {
        return 0;
    }
    return MAX([BinaryTreeNode numberNodeOfTree:root.leftNode], [BinaryTreeNode numberNodeOfTree:root.rightNode]) + 1;
}

+ (NSInteger)depthOfTree:(BinaryTreeNode *)root {
    if (root == nil) {
        return 0;
    }
    if (root.leftNode == nil && root.rightNode == nil) {
        return 1;
    }
    return MAX([BinaryTreeNode depthOfTree:root.leftNode], [BinaryTreeNode depthOfTree:root.rightNode]) + 1;
}

+ (NSInteger)widthOfTree:(BinaryTreeNode *)root {
    if (root == nil) {
        return 0;
    }
    NSMutableArray *queueArray = [NSMutableArray array];
    [queueArray addObject:root];
    NSInteger curWidth = 1;
    NSInteger maxWidth = 0;
    while (queueArray.count > 0) {
        curWidth = queueArray.count;
        for (NSInteger i = 0; i < curWidth; i ++) {
            BinaryTreeNode *node = queueArray.firstObject;
            [queueArray removeObjectAtIndex:0];
            if (node.leftNode) {
                [queueArray addObject:node.leftNode];
            }
            if (node.rightNode) {
                [queueArray addObject:node.rightNode];
            }
        }
        maxWidth = MAX(maxWidth, queueArray.count);
    }
    return maxWidth;
}

+ (void)levelTraverseTreeNode:(BinaryTreeNode *)root handler:(void (^)(BinaryTreeNode *))handler {
    if (root != nil) {
        NSMutableArray *queueArray = [NSMutableArray array];
        [queueArray addObject:root];
        while (queueArray.count > 0) {
            BinaryTreeNode *node = queueArray.firstObject;
            if (handler != nil) {
                handler(node);
            }
            [queueArray removeObjectAtIndex:0];
            if (node.leftNode) {
                [queueArray addObject:node.leftNode];
            }
            if (node.rightNode) {
                [queueArray addObject:node.rightNode];
            }
        }
    }
}

+ (void)preOrderTraverseTreeNode:(BinaryTreeNode *)root handler:(void (^)(BinaryTreeNode *))handler {
    if (root != nil) {
        if (handler != nil) {
            handler(root);
        }
        [BinaryTreeNode preOrderTraverseTreeNode:root.leftNode handler:handler];
        [BinaryTreeNode preOrderTraverseTreeNode:root.rightNode handler:handler];
    }
}

+ (void)inOrderTraverseTreeNode:(BinaryTreeNode *)root handler:(void (^)(BinaryTreeNode *))handler {
    if (root != nil) {
        [BinaryTreeNode inOrderTraverseTreeNode:root.leftNode handler:handler];
        if (handler != nil) {
            handler(root);
        }
        [BinaryTreeNode inOrderTraverseTreeNode:root.rightNode handler:handler];
    }
}

+ (void)backOrderTraverseTreeNode:(BinaryTreeNode *)root handler:(void (^)(BinaryTreeNode *))handler {
    if (root != nil) {
        [BinaryTreeNode backOrderTraverseTreeNode:root.leftNode handler:handler];
        [BinaryTreeNode backOrderTraverseTreeNode:root.rightNode handler:handler];
        if (handler != nil) {
            handler(root);
        }
    }
}

+ (BinaryTreeNode *)findNodeAtIndex:(NSInteger)index inRootNode:(BinaryTreeNode *)rootTree {
    if (index < 0 || rootTree == nil) {
        return nil;
    }
    NSMutableArray *queueArray = [NSMutableArray array];
    [queueArray addObject:rootTree];
    while (queueArray.count > 0) {
        BinaryTreeNode *node = queueArray.firstObject;
        if (index == 0) {
            return node;
        }
        index --;
        [queueArray removeObjectAtIndex:0];
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
    }
    return nil;
}

+ (BinaryTreeNode *)createBinaryTreeWothValues:(NSArray<NSNumber *> *)values {
    BinaryTreeNode *root = nil;
    for (NSInteger index = 0; index < values.count; index ++) {
        root = [BinaryTreeNode add2RootNode:root withValue:values[index].integerValue];
    }
    return root;
}

+ (BinaryTreeNode *)add2RootNode:(BinaryTreeNode *)rootNode withValue:(NSInteger )value {
    if (rootNode == nil) {
        rootNode = [[BinaryTreeNode alloc] init];
        rootNode.value = value;
    } else if (value <= rootNode.value) {
        rootNode.leftNode = [BinaryTreeNode add2RootNode:rootNode.leftNode withValue:value];
    } else {
        rootNode.rightNode = [BinaryTreeNode add2RootNode:rootNode.rightNode withValue:value];
    }
    return rootNode;
}

@end
