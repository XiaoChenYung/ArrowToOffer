//
//  BinaryTreeNode.m
//  ArrowToOffer
//
//  Created by xiaochen yang on 2018/1/17.
//  Copyright © 2018年 xiaochen yang. All rights reserved.
//

#import "BinaryTreeNode.h"

@interface TreeNodeProperty : NSObject

@property (nonatomic, assign) NSInteger distance;

@property (nonatomic, assign) NSInteger depth;

@end

@implementation TreeNodeProperty

@end

@implementation BinaryTreeNode

+ (NSArray *)pathForNode:(BinaryTreeNode *)node inTree:(BinaryTreeNode *)root {
    NSMutableArray *pathArray = [NSMutableArray array];
    [BinaryTreeNode isFindNode:node inTree:root pathArray:pathArray];
    return pathArray.copy;
}

+ (BOOL)isFindNode:(BinaryTreeNode *)node inTree:(BinaryTreeNode *)root pathArray:(NSMutableArray *)pathArray {
    if (root == nil) {
        return false;
    }
    if (root == node) {
        [pathArray addObject:node];
        return true;
    }
    [pathArray addObject:root];
    BOOL isFind = [BinaryTreeNode isFindNode:node inTree:root.leftNode pathArray:pathArray];
    if (isFind == false) {
        isFind = [BinaryTreeNode isFindNode:node inTree:root.rightNode pathArray:pathArray];
    }
    if (isFind == false) {
        [pathArray removeObject:root];
    }
    return isFind;
}

+ (NSInteger)maxDistanceOfTreeSmart:(BinaryTreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    //    方案2：将计算节点深度和最大距离放到一次递归中计算，方案一是分别单独递归计算深度和最远距离
    TreeNodeProperty *p = [self propertyOfTreeNode:rootNode];
    return p.distance;
}

+ (TreeNodeProperty *)propertyOfTreeNode:(BinaryTreeNode *)rootNode {
    NSLog(@"执行了");
    if (!rootNode) {
        return nil;
    }
    
    TreeNodeProperty *left = [self propertyOfTreeNode:rootNode.leftNode];
    TreeNodeProperty *right = [self propertyOfTreeNode:rootNode.rightNode];
    TreeNodeProperty *p = [TreeNodeProperty new];
    //节点的深度depth = 左子树深度、右子树深度中最大值+1（+1是因为根节点占了1个depth）
    p.depth = MAX(left.depth, right.depth) + 1;
    //最远距离 = 左子树最远距离、右子树最远距离和横跨左右子树最远距离中最大值
    p.distance = MAX(MAX(left.distance, right.distance), left.depth+right.depth);
    
    return p;
}

+ (NSInteger)maxDistanceOfTree:(BinaryTreeNode *)root {
    NSLog(@"执行了");
    if (root == nil) {
        return 0;
    }
    NSInteger maxDepth = [BinaryTreeNode depthOfTree:root.leftNode] + [BinaryTreeNode depthOfTree:root.rightNode];
    NSInteger maxLeft = [BinaryTreeNode maxDistanceOfTree:root.leftNode];
    NSInteger maxRight = [BinaryTreeNode maxDistanceOfTree:root.rightNode];
    return MAX(MAX(maxDepth, maxLeft), maxRight);
}

+ (NSInteger)numberLeavesNodeOfTree:(BinaryTreeNode *)root {
    if (root == nil) {
        return 0;
    }
    if (root.leftNode == nil && root.rightNode == nil) {
        return 1;
    }
    return [BinaryTreeNode numberLeavesNodeOfTree:root.leftNode] + [BinaryTreeNode numberLeavesNodeOfTree:root.rightNode];
}

+ (NSInteger)numberNodeOnLevel:(NSInteger)level ofTree:(BinaryTreeNode *)root {
    if (root == nil) {
        return 0;
    }
    if (level == 0) {
        return 1;
    }
    return [BinaryTreeNode numberNodeOnLevel:level - 1 ofTree:root.leftNode] + [BinaryTreeNode numberNodeOnLevel:level - 1 ofTree:root.rightNode];
}

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
