//
//  BinaryTreeNode.h
//  ArrowToOffer
//
//  Created by xiaochen yang on 2018/1/17.
//  Copyright © 2018年 xiaochen yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

@property (nonatomic, strong) BinaryTreeNode *leftNode;

@property (nonatomic, strong) BinaryTreeNode *rightNode;

@property (nonatomic, assign) NSInteger value;

+ (BinaryTreeNode *)createBinaryTreeWothValues:(NSArray <NSNumber *>*)values;

+ (BinaryTreeNode *)findNodeAtIndex:(NSInteger )index inRootNode:(BinaryTreeNode *)rootTree;

+ (void)preOrderTraverseTreeNode:(BinaryTreeNode *)root handler:(void(^)(BinaryTreeNode *rootNode))handler;

+ (void)inOrderTraverseTreeNode:(BinaryTreeNode *)root handler:(void(^)(BinaryTreeNode *rootNode))handler;

+ (void)backOrderTraverseTreeNode:(BinaryTreeNode *)root handler:(void(^)(BinaryTreeNode *rootNode))handler;

+ (void)levelTraverseTreeNode:(BinaryTreeNode *)root handler:(void(^)(BinaryTreeNode *rootNode))handler;

+ (NSInteger)depthOfTree:(BinaryTreeNode *)root;

+ (NSInteger)widthOfTree:(BinaryTreeNode *)root;

+ (NSInteger)numberNodeOfTree:(BinaryTreeNode *)root;

+ (NSInteger)numberNodeOnLevel:(NSInteger)level ofTree:(BinaryTreeNode *)root;

+ (NSInteger)numberLeavesNodeOfTree:(BinaryTreeNode *)root;

+ (NSInteger)maxDistanceOfTree:(BinaryTreeNode *)root;

@end
