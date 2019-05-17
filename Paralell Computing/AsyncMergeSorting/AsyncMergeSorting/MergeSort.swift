//
//  MergeSort.swift
//  AsyncMergeSorting
//
//  Created by verofieiev on 4/17/19.
//  Copyright © 2019 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation


func parralelMergeSortOperations<T: Comparable>(items: inout Array<T>)
    -> (list: [MergingOperation<T>], op:MergingOperation<T>?)  {
        if (items.count <= 1) {
            let lastOperation = MergingOperation(items: &items)
            return ([lastOperation], lastOperation);
        }
        var operations = [MergingOperation<T>]()
        let leftSize = items.count / 2
        var leftItems = Array(items[0..<leftSize])
        var rightItems = Array(items[leftSize..<items.count])
        let merging = MergingOperation(items: &items)
        let left = parralelMergeSortOperations(items: &leftItems)
        let right = parralelMergeSortOperations(items: &rightItems)
        left.op.map{ merging.addDependency($0) }
        right.op.map{ merging.addDependency($0) }

        operations.append(contentsOf: left.list)
        operations.append(contentsOf: right.list)
        operations.append(merging)
        return (operations, merging)
}


func sort<T: Comparable>(items: inout Array<T>, processors: Int) {
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = processors
    let computing = parralelMergeSortOperations(items: &items)
    queue.addOperations(computing.list, waitUntilFinished: true)
    items = computing.op?.result ?? items
}


func sort<T: Comparable>(items: inout Array<T>) {
    if (items.count <= 1) {
        return;
    }
    let leftSize = items.count / 2
    var leftItems = Array(items[0..<leftSize])
    var rightItems = Array(items[leftSize..<items.count])
    sort(items: &leftItems)
    sort(items: &rightItems)
    merge(items: &items, left: leftItems, right: rightItems)
}

func merge<T: Comparable>(items: inout Array<T>, left: Array<T>, right: Array<T>) {
    var leftIndex = 0
    var rightIndex = 0
    let count = left.count + right.count
    
    for index in 0..<count {
        if leftIndex >= left.count {
            items[index] = right[rightIndex]
            rightIndex+=1
        } else if rightIndex >= right.count {
            items[index] = left[leftIndex]
            leftIndex+=1
        } else if left[leftIndex] < right[rightIndex] {
            items[index] = left[leftIndex]
            leftIndex+=1
        } else {
            items[index] = right[rightIndex]
            rightIndex+=1
        }
    }
}

