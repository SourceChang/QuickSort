//
//  ViewController.m
//  QuickSort
//
//  Created by Source on 2020/9/29.
//  Copyright © 2020 Source. All rights reserved.
//

#import "ViewController.h"
#import "Sorter.h"


#include <iostream>


#include "QuickSort.hpp"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
//    std::vector<int> array1 = { 9, 8, 7, 6, 5, 4, 3, 2, 1 };
    std::vector<int> array1 = { 4, 2, 3, 8, 7, 6, 1, 2, 3, 9, 8, 7 };
    QuickSort::sortV1(array1);
    for ( auto value : array1 ) {
        
        std::cout << value << " ";
    }
    std::cout << std::endl;
    
//    std::vector<int> array2 = { 9, 8, 7, 6, 5, 4, 3, 2, 1 };
    std::vector<int> array2 = { 4, 2, 3, 8, 7, 6, 1, 2, 3, 9, 8, 7 };
    QuickSort::sortV2(array2);
    for ( auto value : array2 ) {
        
        std::cout << value << " ";
    }
    std::cout << std::endl;
    
//    std::vector<int> array3 = { 9, 8, 7, 6, 5, 4, 3, 2, 1 };
    std::vector<int> array3 = { 4, 2, 3, 8, 7, 6, 1, 2, 3, 9, 8, 7 };
//    std::vector<int> array3 = { 1, 3, 2 };
    QuickSort::sortV3(array3);
    for ( auto value : array3 ) {
        
        std::cout << value << " ";
    }
    std::cout << std::endl;
    
    
    NSLog(@"%@", [[Sorter quickSortV1:@[ @1, @3, @2 ]] componentsJoinedByString:@", "]);
    NSLog(@"%@", [[Sorter quickSortV1:@[ @4, @2, @3, @8, @7, @6, @1, @2, @3, @9, @8, @7 ]] componentsJoinedByString:@", "]);
    NSLog(@"%@", [[Sorter quickSortV1:@[ @9, @8, @7, @6, @5, @4, @3, @2, @1 ]] componentsJoinedByString:@", "]);
    
    NSLog(@"%@", [[Sorter quickSortV2:@[ @1, @3, @2 ]] componentsJoinedByString:@", "]);
    NSLog(@"%@", [[Sorter quickSortV2:@[ @4, @2, @3, @8, @7, @6, @1, @2, @3, @9, @8, @7 ]] componentsJoinedByString:@", "]);
    NSLog(@"%@", [[Sorter quickSortV2:@[ @9, @8, @7, @6, @5, @4, @3, @2, @1 ]] componentsJoinedByString:@", "]);
    
    NSLog(@"%@", [[Sorter quickSortV3:@[ @1, @3, @2 ]] componentsJoinedByString:@", "]);
    NSLog(@"%@", [[Sorter quickSortV3:@[ @4, @2, @3, @8, @7, @6, @1, @2, @3, @9, @8, @7 ]] componentsJoinedByString:@", "]);
    NSLog(@"%@", [[Sorter quickSortV3:@[ @9, @8, @7, @6, @5, @4, @3, @2, @1 ]] componentsJoinedByString:@", "]);
    
}


@end
