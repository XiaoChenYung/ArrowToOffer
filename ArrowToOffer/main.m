//
//  main.m
//  ArrowToOffer
//
//  Created by xiaochen yang on 2017/11/15.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import <Foundation/Foundation.h>

void bubbleSort(int array[], int len);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int array[] = {8, 3, 6, 2, 1, 5, 4, 4, 9, 0};
        bubbleSort(array, 10);
        for (int i = 0; i < 10; i ++) {
            printf("%d\n",array[i]);
        }
    }
    return 0;
}

/**
 冒泡排序

 @param array 输入的数组
 @param len 数组大小
 */
void bubbleSort(int array[], int len) {
    for (int i = 0; i < len - 1; i ++) {
        for (int j = 0; j < len - i - 1; j ++) {
            if (array[j] > array[j + 1]) {
                int temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}
