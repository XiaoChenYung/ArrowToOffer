//
//  BinaryTreeNode.m
//  ArrowToOffer
//
//  Created by xiaochen yang on 2018/1/17.
//  Copyright © 2018年 xiaochen yang. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

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
