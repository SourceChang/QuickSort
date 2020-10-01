//
//  QuickSort.hpp
//  QuickSort
//
//  Created by Source on 2020/9/29.
//  Copyright © 2020 Source. All rights reserved.
//

#ifndef QuickSort_hpp
#define QuickSort_hpp

#include <stdio.h>
#include <vector>


class QuickSort {
public:
    static void sortV1(std::vector<int>& arrNumbers);
    static void sortV2(std::vector<int>& arrNumbers);
    static void sortV3(std::vector<int>& arrNumbers);
private:
    static void sortV1(std::vector<int>& arrNumbers, int startIndex, int endIndex);
    static void sortV2(std::vector<int>& arrNumbers, int startIndex, int endIndex);
    static void sortV3(std::vector<int>& arrNumbers, int startIndex, int endIndex);
    static int partitionV1(std::vector<int>& arrNumbers, int startIndex, int endIndex);
    static int partitionV2(std::vector<int>& arrNumbers, int startIndex, int endIndex);
    static int partitionV3(std::vector<int>& arrNumbers, int startIndex, int endIndex);
};


#endif /* QuickSort_hpp */
