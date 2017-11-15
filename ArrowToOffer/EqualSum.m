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
    NSNumber *tempRightNumber = array[right];//取出数组最右侧的值
    NSInteger tempRightValue = tempRightNumber.integerValue;
    while (tempRightValue > value) {//待比较值与最右侧值做比较,一直找到比待比较值小的数，这样会比较节约时间
        --right;
        tempRightNumber = array[right];
        tempRightValue = tempRightNumber.integerValue;
    }
    NSNumber *tempLeftNumber = array[left];
    NSInteger tempLeftValue = tempLeftNumber.integerValue;
    while (tempLeftValue + tempRightValue < value) {//去掉最小的不可能用到的数据
        ++left;
        tempLeftNumber = array[left];
        tempLeftValue = tempLeftNumber.integerValue;
    }
    while (left < right) {
        if (tempLeftValue + tempRightValue == value) {//如果想等自然最好，打印两个值
            NSLog(@"最小的值为%zu, 最大的值为%zu",tempLeftValue, tempRightValue);
            return true;
        } else if (tempLeftValue + tempRightValue > value) {//玩大了那右边指针前移
            --right;
        } else {
            ++left;//玩小了左边指针后移
        }
    }
    
    return false;
}

@end
