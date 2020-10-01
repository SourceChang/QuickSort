//
//  Sorter.h
//  QuickSort
//
//  Created by Source on 2020/9/29.
//  Copyright © 2020 Source. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sorter : NSObject


+ (nullable NSArray<NSNumber *> *)quickSortV1:(nonnull NSArray<NSNumber *> *)arrNumbers;
+ (nullable NSArray<NSNumber *> *)quickSortV2:(nonnull NSArray<NSNumber *> *)arrNumbers;
+ (nullable NSArray<NSNumber *> *)quickSortV3:(nonnull NSArray<NSNumber *> *)arrNumbers;


@end

NS_ASSUME_NONNULL_END
