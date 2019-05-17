//
//  Executor.swift
//  AsyncMergeSorting
//
//  Created by verofieiev on 4/17/19.
//  Copyright © 2019 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation

@discardableResult
func measure<A>(name: String = "", _ block: () -> A) -> A {
    let startTime = CFAbsoluteTimeGetCurrent()
    let result = block()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time: \(name) - \(timeElapsed)")
    return result
}
