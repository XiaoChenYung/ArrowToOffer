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

@end
