//
//  DictionarySort.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/7/21.
//  Copyright © 2021 Sina Gharib. All rights reserved.
//

import Foundation

struct DictionarySort {
    
    //Merge sort taking into account the numeric value of the value, ignoring the key
    static func prioritySort(input data: [String : Int]?) -> [(String, Int)] {
        
        //Null check
        guard let data = data else { return [(String, Int)]() }
        if data.isEmpty { return [(String, Int)]() }
        
        //Convert to tuple array
        var dataArray = [(String, Int)]()
        for pair in data {
            dataArray += [(pair.key, pair.value)]
        }
        
        //Sort
        return mergeSort(input: dataArray)
    }
    
    private static func mergeSort(input data: [(String, Int)]) -> [(String, Int)] {
        
        //Base case
        if data.count == 1 { return data }
        
        //Create recursive partitions
        let a = data.split().left
        let b = data.split().right
        
        return merge(a: mergeSort(input: a), b: mergeSort(input: b))
        
    }
    
    private static func merge(a: [(String, Int)], b: [(String, Int)]) -> [(String, Int)] {
        var result = [(String, Int)]()

        if (a == nil || b == nil || (a.isEmpty && b.isEmpty)) {
            return [(String, Int)]()
        }

        //Iterate through the arrays
        var firstIndex = 0
        var otherIndex = 0;
        while (true) {
            if (firstIndex >= a.count) {
                for index in otherIndex...b.count - 1 {
                    result.append(b[index])
                }
                return result;
            }

            if (otherIndex >= b.count) {
                for index in firstIndex...a.count - 1 {
                    result.append(a[index])
                }
                return result;
            }

            if (a[firstIndex].1 > b[otherIndex].1) {
                result.append(a[firstIndex])
                firstIndex += 1
            } else {
                result.append(b[otherIndex])
                otherIndex += 1
            }
        }
    }
}
