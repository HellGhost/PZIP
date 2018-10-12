//
//  ExpertModel.swift
//  Expert Assessment
//
//  Created by verofieiev on 10/12/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation

struct ExpertAppraisal {
    /// Точність управління та обчислень
    var accuracyOfControlAndComputing: Float = 0
    /// Ступінь стандартності інтерфейсів
    var degreeOfStandardInterfaces: Float = 0
    /// Функціональна повнота
    var functionalCompleteness: Float = 0
    /// Стійкість до помилок
    var errorsResilience: Float = 0
    /// Можливість розширення
    var expandAbility: Float = 0
    /// Зручність роботи
    var workConvenience: Float = 0
    /// Простота роботи
    var workSimplicity: Float = 0
    /// Відповідність чинним стандартам
    var standardsCompliance: Float = 0
    /// Переносимість між ПЗ
    var softwarePortability: Float = 0
    /// Зручність навчання
    var studyConvenience: Float = 0
    
    var allValues: [Float] {
        var values = [Float]()
        Mirror(reflecting: self).children.forEach { child in
            guard let value = child.value as? Float else {
               return
            }
            values.append(value)
        }
        return values
    }

    var summ: Float {
        return allValues.reduce(0.0, { (current, value) -> Float in
            return current+value
        })
    }
    
    var average: Float {
        let countValue = Float(allValues.count)
        return summ / countValue
    }
}
