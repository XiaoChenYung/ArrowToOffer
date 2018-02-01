//
//  main.m
//  ArrowToOffer
//
//  Created by xiaochen yang on 2017/11/15.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import <Foundation/Foundation.h>

void bubbleSort(int array[], int len);
void quickSort(int array[], int low, int high);
void insertSort(int array[], int len);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int array[] = {8, 3, 6, 2, 1, 5, 4, 4, 9, 0};
        bubbleSort(array, 10);
//        quickSort(array, 0, 9);
//        insertSort(array, 10);
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
    if (array == nullptr || len <= 0) {
        return;
    }
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

/**
 快速排序

 @param array 待排序数组
 @param low 数组最小下标
 @param high 数组最大下标
 */

void quickSort(int array[], int low, int high) {
    if (array == nullptr || low > high) {
        return;
    }
    int left = low;
    int right = high;
    int key = array[low];
    while (left != right) {
        while (left < right && array[right] >= key) {
            right --;
        }
        array[left] = array[right];
        while (left < right && array[left] <= key) {
            left ++;
        }
        array[right] = array[left];
    }
    array[left] = key;
    quickSort(array, low, left - 1);
    quickSort(array, left + 1, high);
}























//void quickSort(int array[], int low, int high) {
//    if (array == nullptr || low > high) {
//        return;
//    }
//    int left = low;
//    int right = high;
//    int key = array[low];
//    while (left != right) {
//        while (left < right && key <= array[right]) {
//            right --;
//        }
//        array[left] = array[right];
//        while (left < right && key >= array[left]) {
//            left ++;
//        }
//        array[right] = array[left];
//    }
//    array[left] = key;
//    quickSort(array, low, left - 1);
//    quickSort(array, left + 1, high);
//}

/**
 插入排序

 @param array 待排序数组
 @param len 数组长度
 */
void insertSort(int array[], int len) {
    if (array == nullptr && len <= 0) {
        return;
    }
    int temp = 0;
    for (int i = 1; i < len; i ++) {
        int j = i - 1;
        temp = array[i];
        while (j >= 0 && array[j] > temp) {
            array[j + 1] = array[j];
            j --;
        }
        if (j != i - 1) {
            array[j + 1] = temp;
        }
    }
}
