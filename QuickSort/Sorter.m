//
//  Sorter.m
//  QuickSort
//
//  Created by Source on 2020/9/29.
//  Copyright © 2020 Source. All rights reserved.
//

#import "Sorter.h"

@implementation Sorter


#pragma mark - Public Methods
+ (nullable NSArray<NSNumber *> *)quickSortV1:(nonnull NSArray<NSNumber *> *)arrNumbers {
    
    NSMutableArray<NSNumber *> *arrMNumbers = [arrNumbers mutableCopy];
    [self quickSortV1:arrMNumbers
           startIndex:0
             endIndex:arrMNumbers.count - 1];
    
    return [arrMNumbers copy];
}


+ (nullable NSArray<NSNumber *> *)quickSortV2:(nonnull NSArray<NSNumber *> *)arrNumbers {
    
    NSMutableArray<NSNumber *> *arrMNumbers = [arrNumbers mutableCopy];
    [self quickSortV2:arrMNumbers
           startIndex:0
             endIndex:arrMNumbers.count - 1];
    
    return [arrMNumbers copy];
}


+ (nullable NSArray<NSNumber *> *)quickSortV3:(nonnull NSArray<NSNumber *> *)arrNumbers {
    
    NSMutableArray<NSNumber *> *arrMNumbers = [arrNumbers mutableCopy];
    [self quickSortV3:arrMNumbers
           startIndex:0
             endIndex:arrMNumbers.count - 1];
    
    return [arrMNumbers copy];
}


#pragma mark - Private Methods
// 挖坑法
+ (NSInteger)partitionV1:(nonnull NSMutableArray<NSNumber *> *)arrMNumbers
              startIndex:(NSInteger)startIndex
                endIndex:(NSInteger)endIndex {
    
    
    NSNumber *key = arrMNumbers[startIndex];
    NSInteger i = startIndex;
    NSInteger j = endIndex;
    while ( i < j ) {
        
        while ( i < j && arrMNumbers[j].integerValue >= key.integerValue ) {
            
            --j;
        }
        
        if ( i < j ) {
            
            arrMNumbers[i] = arrMNumbers[j];
        }
        
        while ( i < j && arrMNumbers[i].integerValue <= key.integerValue ) {
            
            ++i;
        }
        
        if ( i < j ) {
            
            arrMNumbers[j] = arrMNumbers[i];
        }
    }
    arrMNumbers[i] = key;
    
    return i;
}


+ (void)quickSortV1:(nonnull NSMutableArray<NSNumber *> *)arrMNumbers
         startIndex:(NSInteger)startIndex
           endIndex:(NSInteger)endIndex {
    
    if ( endIndex <= startIndex ) {
        
        return;
    }
    
    NSInteger index = [self partitionV1:arrMNumbers
                             startIndex:startIndex
                               endIndex:endIndex];
    [self quickSortV1:arrMNumbers
           startIndex:startIndex
             endIndex:index - 1];
    [self quickSortV1:arrMNumbers
           startIndex:index + 1
             endIndex:endIndex];
}


// 指针交换法
+ (NSInteger)partitionV2:(nonnull NSMutableArray<NSNumber *> *)arrMNumbers
              startIndex:(NSInteger)startIndex
                endIndex:(NSInteger)endIndex {
    
    NSInteger i = startIndex;
    NSInteger j = endIndex;
    while ( i != j ) {
        
        while ( i < j && arrMNumbers[j].integerValue >= arrMNumbers[startIndex].integerValue ) {
            
            --j;
        }
        
        while ( i < j && arrMNumbers[i].integerValue <= arrMNumbers[startIndex].integerValue ) {
            
            ++i;
        }
        
        if ( i < j ) {
            
            NSNumber *temp = arrMNumbers[i];
            arrMNumbers[i] = arrMNumbers[j];
            arrMNumbers[j] = temp;
        }
    }
    NSNumber *temp = arrMNumbers[i];
    arrMNumbers[i] = arrMNumbers[startIndex];
    arrMNumbers[startIndex] = temp;
    
    return i;
}


+ (void)quickSortV2:(nonnull NSMutableArray<NSNumber *> *)arrMNumbers
         startIndex:(NSInteger)startIndex
           endIndex:(NSInteger)endIndex {
    
    if ( endIndex <= startIndex ) {
        
        return;
    }
    
    NSInteger index = [self partitionV2:arrMNumbers
                             startIndex:startIndex
                               endIndex:endIndex];
    [self quickSortV2:arrMNumbers
           startIndex:startIndex
             endIndex:index - 1];
    [self quickSortV2:arrMNumbers
           startIndex:index + 1
             endIndex:endIndex];
}


// 前后指针法
+ (NSInteger)partitionV3:(nonnull NSMutableArray<NSNumber *> *)arrMNumbers
              startIndex:(NSInteger)startIndex
                endIndex:(NSInteger)endIndex {
    
    NSInteger cur = startIndex;
    NSInteger pre = cur - 1;
    while ( cur <= endIndex && pre <= endIndex ) {

        while ( cur <= endIndex && arrMNumbers[cur].integerValue <= arrMNumbers[startIndex].integerValue ) {

            ++cur;
            pre = cur - 1;
        }

        while ( cur <= endIndex && arrMNumbers[cur].integerValue >= arrMNumbers[startIndex].integerValue ) {

            ++cur;
        }

        if ( cur <= endIndex && pre + 1 <= endIndex && pre + 1 < cur ) {

            NSNumber *temp = arrMNumbers[cur];
            arrMNumbers[cur] = arrMNumbers[pre + 1];
            arrMNumbers[pre + 1] = temp;

            pre = pre + 1;
            cur = pre + 1;
        }
    }
    if ( pre != startIndex && pre <= endIndex ) {

        NSNumber *temp = arrMNumbers[pre];
        arrMNumbers[pre] = arrMNumbers[startIndex];
        arrMNumbers[startIndex] = temp;
    }
    
    return pre;
}


+ (void)quickSortV3:(nonnull NSMutableArray<NSNumber *> *)arrMNumbers
         startIndex:(NSInteger)startIndex
           endIndex:(NSInteger)endIndex {
    
    if ( endIndex <= startIndex ) {
        
        return;
    }
    
    NSInteger index = [self partitionV3:arrMNumbers
                             startIndex:startIndex
                               endIndex:endIndex];
    if ( index == -1 ) {
        
        return;
    }
    [self quickSortV3:arrMNumbers
           startIndex:startIndex
             endIndex:index - 1];
    [self quickSortV3:arrMNumbers
           startIndex:index + 1
             endIndex:endIndex];
}


@end
