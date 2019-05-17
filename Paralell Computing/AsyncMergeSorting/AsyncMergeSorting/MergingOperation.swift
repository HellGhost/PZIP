//
//  MergingOperation.swift
//  AsyncMergeSorting
//
//  Created by verofieiev on 4/17/19.
//  Copyright © 2019 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation

class MergingOperation<T: Comparable>: Operation {
    override var isAsynchronous: Bool {
        return true
    }
    
    private var items: Array<T>
    var result = Array<T>()
    init(items: inout Array<T>) {
        self.items = items
    }

    override func main() {
        
        guard let leftResult = self.dependencies.first as? MergingOperation<T>,
            let rightResult = self.dependencies.last as? MergingOperation<T> else {
                result = items
                return
        }
        let left = leftResult.result
        let right = rightResult.result

        merge(items: &items, left: left, right: right)
        result = items
    }
}
