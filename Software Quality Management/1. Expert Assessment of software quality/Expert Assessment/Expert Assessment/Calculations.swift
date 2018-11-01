//
//  Calculations.swift
//  Expert Assessment
//
//  Created by verofieiev on 10/31/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation

class DiagrammCalculator {
    static func calculateDiagramm(base: ExpertAppraisal, avg: ExpertAppraisal, weight: Float) -> (triangles: [Triangle], square: Float){
        let parts = base.allValues.map {($0/base.summ) * 360.0}
        let initialValue = (parts.first! * -0.5)
        var previousValue = initialValue
        let additions = parts.map{ value -> Float in
            previousValue = previousValue + value
            return previousValue
        }
        previousValue = initialValue
        let radians = additions.map { value -> Float in
            let result = (value + previousValue) / 2
            previousValue = value
            return Float((Double(result) * M_PI) / 180.0)
        }
        let avgWeight = avg.allValues.map {
            $0 * weight
        }
        var triangles = [Triangle]()
        for i in 0..<10 {
            let a = sinf(radians[i])*avgWeight[i]
            let b = cosf(radians[i])*avgWeight[i]
            let c = sqrtf(a*a+b*b)
            triangles.append(Triangle(a: a,
                                      b: b,
                                      c: c))
        }
        
        var trianglesForSquare = triangles
        trianglesForSquare.append(triangles.first!)

        var square: Float = 0
        for index in 0..<(trianglesForSquare.count-1) {
            let first = trianglesForSquare[index].a * trianglesForSquare[index+1].b
            let second = trianglesForSquare[index].b * trianglesForSquare[index+1].a
            square += abs(first-second)
        }
        return (triangles, square/2)
    }
}

