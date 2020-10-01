//
//  QuickSort.cpp
//  QuickSort
//
//  Created by Source on 2020/9/29.
//  Copyright © 2020 Source. All rights reserved.
//


#include "QuickSort.hpp"


// 挖坑法
int QuickSort::partitionV1(std::vector<int> &arrNumbers, int startIndex, int endIndex) {
    
    int key = arrNumbers[startIndex];
    int i = startIndex;
    int j = endIndex;
    while ( i < j ) {
        
        while ( i < j && arrNumbers[j] >= key ) {
            
            --j;
        }
        
        if ( i < j ) {
            
            arrNumbers[i] = arrNumbers[j];
        }
        
        while ( i < j && arrNumbers[i] <= key ) {
            
            ++i;
        }
        
        if ( i < j ) {
            
            arrNumbers[j] = arrNumbers[i];
        }
    }
    arrNumbers[i] = key;
    
    return i;
}


void QuickSort::sortV1(std::vector<int>& arrNumbers, int startIndex, int endIndex) {
    
    if ( endIndex <= startIndex ) {
        
        return;
    }
    
    int index = partitionV1( arrNumbers, startIndex, endIndex );
    sortV1( arrNumbers, startIndex, index - 1 );
    sortV1( arrNumbers, index + 1, endIndex );
}


void QuickSort::sortV1(std::vector<int>& arrNumbers) {
    
    sortV1( arrNumbers, 0, arrNumbers.size() - 1 );
}


// 指针交换法
int QuickSort::partitionV2(std::vector<int> &arrNumbers, int startIndex, int endIndex) {
    
    int i = startIndex;
    int j = endIndex;
    while ( i != j ) {
        
        while ( i < j && arrNumbers[j] >= arrNumbers[startIndex] ) {
            
            --j;
        }
        
        while ( i < j && arrNumbers[i] <= arrNumbers[startIndex] ) {
            
            ++i;
        }
        
        if ( i < j ) {
            
            // swap
            arrNumbers[i] = arrNumbers[i] ^ arrNumbers[j];
            arrNumbers[j] = arrNumbers[i] ^ arrNumbers[j];
            arrNumbers[i] = arrNumbers[i] ^ arrNumbers[j];
        }
    }
    if ( i != startIndex) {
        
        arrNumbers[i] = arrNumbers[i] ^ arrNumbers[startIndex];
        arrNumbers[startIndex] = arrNumbers[i] ^ arrNumbers[startIndex];
        arrNumbers[i] = arrNumbers[i] ^ arrNumbers[startIndex];
    }
    
    return i;
}


void QuickSort::sortV2(std::vector<int>& arrNumbers, int startIndex, int endIndex) {
    
    if ( endIndex <= startIndex ) {
        
        return;
    }
    
    int index = partitionV2( arrNumbers, startIndex, endIndex );
    sortV2( arrNumbers, startIndex, index - 1 );
    sortV2( arrNumbers, index + 1, endIndex );
}


void QuickSort::sortV2(std::vector<int>& arrNumbers) {
    
    sortV2(arrNumbers, 0, arrNumbers.size() - 1);
}


int QuickSort::partitionV3(std::vector<int> &arrNumbers, int startIndex, int endIndex) {
    
    int cur = startIndex;
    int pre = cur - 1;
    while ( cur <= endIndex ) {
        
        while ( cur <= endIndex && arrNumbers[cur] <= arrNumbers[startIndex] ) {
            
            ++cur;
            pre = cur - 1;
        }
        
        while ( cur <= endIndex && arrNumbers[cur] >= arrNumbers[startIndex] ) {
            
            ++cur;
        }
        
        if ( cur <= endIndex && pre + 1 < cur ) {
            
            std::swap( arrNumbers[pre + 1], arrNumbers[cur] );
            pre = pre + 1;
            cur = pre + 1;
        }
    }
    if ( pre <= endIndex && pre != startIndex ) {
        
        std::swap( arrNumbers[pre], arrNumbers[startIndex] );
    }
    
    return pre;
}


void QuickSort::sortV3(std::vector<int>& arrNumbers, int startIndex, int endIndex) {
    
    if ( endIndex <= startIndex ) {
        
        return;
    }
    
    int index = partitionV3( arrNumbers, startIndex, endIndex );
    sortV3( arrNumbers, startIndex, index - 1 );
    sortV3( arrNumbers, index + 1, endIndex );
}


// 非递归
void QuickSort::sortV3(std::vector<int>& arrNumbers) {
    
    sortV3(arrNumbers, 0, arrNumbers.size() - 1);
}

