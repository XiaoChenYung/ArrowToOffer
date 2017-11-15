//
//  EqualSum.m
//  ArrowToOffer
//
//  Created by xiaochen yang on 2017/11/15.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import "EqualSum.h"

@implementation EqualSum

+ (BOOL)equalSubWithArray:(NSArray *)array value:(NSInteger )value {
    if (array == nil || array.count == 0) {
        return false;
    }
    NSInteger left = 0;
    NSInteger right = array.count - 1;
    NSNumber *tempRightNumber = array[right];
    NSInteger tempRightValue = tempRightNumber.integerValue;
    while (tempRightValue > value) {
        --right;
        tempRightNumber = array[right];
        tempRightValue = tempRightNumber.integerValue;
    }
    NSNumber *tempLeftNumber = array[left];
    NSInteger tempLeftValue = tempLeftNumber.integerValue;
    while (tempLeftValue + tempRightValue < value) {
        ++left;
        tempLeftNumber = array[left];
        tempLeftValue = tempLeftNumber.integerValue;
    }
    if (tempLeftValue + tempRightValue == value) {
        NSLog(@"最小的值为%zu, 最大的值为%zu",tempLeftValue, tempRightValue);
        return true;
    } else {
        if (right - left - 1 > left) {
            [self equalSubWithArray:[array subarrayWithRange:NSMakeRange(left, right - left - 1)] value:value];
        }
    }
    return false;
}

@end
