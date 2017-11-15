//
//  EqualSum.h
//  ArrowToOffer
//
//  Created by xiaochen yang on 2017/11/15.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 题目：输入一个已经按升序排序过的数组和一个数字，在数组中查找两个数，使得它们的和正好是输入的那个数字。
 要求时间复杂度是O(n)。如果有多对数字的和等于输入的数字，输出任意一对即可。
 例如输入数组1、2、4、7、11、15和数字15。由于4+11=15，因此输出4和11。
 **/

@interface EqualSum : NSObject

+ (BOOL)equalSubWithArray:(NSArray *)array value:(NSInteger )value;

@end
