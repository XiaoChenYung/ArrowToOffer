//
//  main.m
//  ArrowToOffer
//
//  Created by xiaochen yang on 2017/11/15.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"
#import "EqualSum.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [EqualSum equalSubWithArray:@[@1, @3, @4, @8, @9] value:12];
        // insert code here...
        BinaryTreeNode *root = [BinaryTreeNode createBinaryTreeWothValues:@[@2, @7, @5, @8, @1, @11, @4, @3, @9]];
        NSLog(@"Hello, World!");
    }
    return 0;
}
