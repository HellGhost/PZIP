//
//  ExpertModel.swift
//  Expert Assessment
//
//  Created by verofieiev on 10/12/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation

struct ExpertAppraisal: Codable {
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

//MARK: Math
extension ExpertAppraisal {
    static func +(lhs: ExpertAppraisal, rhs: ExpertAppraisal) -> ExpertAppraisal {
        
        return ExpertAppraisal(accuracyOfControlAndComputing: lhs.accuracyOfControlAndComputing + rhs.accuracyOfControlAndComputing,
                               degreeOfStandardInterfaces: lhs.degreeOfStandardInterfaces + rhs.degreeOfStandardInterfaces,
                               functionalCompleteness: lhs.functionalCompleteness + rhs.functionalCompleteness,
                               errorsResilience: lhs.errorsResilience + rhs.errorsResilience,
                               expandAbility: lhs.expandAbility + rhs.expandAbility,
                               workConvenience: lhs.workConvenience + rhs.workConvenience,
                               workSimplicity: lhs.workSimplicity + rhs.workSimplicity,
                               standardsCompliance: lhs.standardsCompliance + rhs.standardsCompliance,
                               softwarePortability: lhs.softwarePortability + rhs.softwarePortability,
                               studyConvenience: lhs.studyConvenience + rhs.studyConvenience)
    }
    
    static func *(lhs: ExpertAppraisal, rhs: ExpertAppraisal) -> ExpertAppraisal {
        
        return ExpertAppraisal(accuracyOfControlAndComputing: lhs.accuracyOfControlAndComputing * rhs.accuracyOfControlAndComputing,
                               degreeOfStandardInterfaces: lhs.degreeOfStandardInterfaces * rhs.degreeOfStandardInterfaces,
                               functionalCompleteness: lhs.functionalCompleteness * rhs.functionalCompleteness,
                               errorsResilience: lhs.errorsResilience * rhs.errorsResilience,
                               expandAbility: lhs.expandAbility * rhs.expandAbility,
                               workConvenience: lhs.workConvenience * rhs.workConvenience,
                               workSimplicity: lhs.workSimplicity * rhs.workSimplicity,
                               standardsCompliance: lhs.standardsCompliance * rhs.standardsCompliance,
                               softwarePortability: lhs.softwarePortability * rhs.softwarePortability,
                               studyConvenience: lhs.studyConvenience * rhs.studyConvenience)
    }
    
    static func /(lhs: ExpertAppraisal, rhs: ExpertAppraisal) -> ExpertAppraisal {
        
        return ExpertAppraisal(accuracyOfControlAndComputing: lhs.accuracyOfControlAndComputing / rhs.accuracyOfControlAndComputing,
                               degreeOfStandardInterfaces: lhs.degreeOfStandardInterfaces / rhs.degreeOfStandardInterfaces,
                               functionalCompleteness: lhs.functionalCompleteness / rhs.functionalCompleteness,
                               errorsResilience: lhs.errorsResilience / rhs.errorsResilience,
                               expandAbility: lhs.expandAbility / rhs.expandAbility,
                               workConvenience: lhs.workConvenience / rhs.workConvenience,
                               workSimplicity: lhs.workSimplicity / rhs.workSimplicity,
                               standardsCompliance: lhs.standardsCompliance / rhs.standardsCompliance,
                               softwarePortability: lhs.softwarePortability / rhs.softwarePortability,
                               studyConvenience: lhs.studyConvenience / rhs.studyConvenience)
    }
    
    static func /(lhs: ExpertAppraisal, rhs: ExpertGroup) -> ExpertAppraisal {
        
        return ExpertAppraisal(accuracyOfControlAndComputing: lhs.accuracyOfControlAndComputing / rhs.averageAccuracyOfControlAndComputing,
                               degreeOfStandardInterfaces: lhs.degreeOfStandardInterfaces / rhs.averageDegreeOfStandardInterfaces,
                               functionalCompleteness: lhs.functionalCompleteness / rhs.averageFunctionalCompleteness,
                               errorsResilience: lhs.errorsResilience / rhs.averageErrorsResilience,
                               expandAbility: lhs.expandAbility / rhs.averageExpandAbility,
                               workConvenience: lhs.workConvenience / rhs.averageWorkConvenience,
                               workSimplicity: lhs.workSimplicity / rhs.averageWorkSimplicity,
                               standardsCompliance: lhs.standardsCompliance / rhs.averageStandardsCompliance,
                               softwarePortability: lhs.softwarePortability / rhs.averageSoftwarePortability,
                               studyConvenience: lhs.studyConvenience / rhs.averageStudyConvenience)
    }
    
    static func *(lhs: ExpertAppraisal, rhs: Float) -> ExpertAppraisal {
        return ExpertAppraisal(accuracyOfControlAndComputing: lhs.accuracyOfControlAndComputing * rhs,
                               degreeOfStandardInterfaces: lhs.degreeOfStandardInterfaces * rhs,
                               functionalCompleteness: lhs.functionalCompleteness * rhs,
                               errorsResilience: lhs.errorsResilience * rhs,
                               expandAbility: lhs.expandAbility * rhs,
                               workConvenience: lhs.workConvenience * rhs,
                               workSimplicity: lhs.workSimplicity * rhs,
                               standardsCompliance: lhs.standardsCompliance * rhs,
                               softwarePortability: lhs.softwarePortability * rhs,
                               studyConvenience: lhs.studyConvenience * rhs)
    }
    static func /(lhs: ExpertAppraisal, rhs: Float) -> ExpertAppraisal {
        return ExpertAppraisal(accuracyOfControlAndComputing: lhs.accuracyOfControlAndComputing / rhs,
                               degreeOfStandardInterfaces: lhs.degreeOfStandardInterfaces / rhs,
                               functionalCompleteness: lhs.functionalCompleteness / rhs,
                               errorsResilience: lhs.errorsResilience / rhs,
                               expandAbility: lhs.expandAbility / rhs,
                               workConvenience: lhs.workConvenience / rhs,
                               workSimplicity: lhs.workSimplicity / rhs,
                               standardsCompliance: lhs.standardsCompliance / rhs,
                               softwarePortability: lhs.softwarePortability / rhs,
                               studyConvenience: lhs.studyConvenience / rhs)
    }
}

extension ExpertAppraisal {
    init(random max: Int) {
        self.accuracyOfControlAndComputing = Float(Int.random(in: 2...max))
        self.degreeOfStandardInterfaces = Float(Int.random(in: 2...max))
        self.functionalCompleteness = Float(Int.random(in: 2...max))
        self.errorsResilience = Float(Int.random(in: 2...max))
        self.expandAbility = Float(Int.random(in: 2...max))
        self.workConvenience = Float(Int.random(in: 2...max))
        self.workSimplicity = Float(Int.random(in: 2...max))
        self.standardsCompliance = Float(Int.random(in: 2...max))
        self.softwarePortability = Float(Int.random(in: 2...max))
        self.studyConvenience = Float(Int.random(in: 2...max))
    }
}
