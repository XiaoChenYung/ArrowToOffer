//
//  BinaryTreeNode.m
//  ArrowToOffer
//
//  Created by xiaochen yang on 2018/1/17.
//  Copyright © 2018年 xiaochen yang. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

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
