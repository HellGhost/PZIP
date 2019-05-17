//
//  ExpertGroupModel.swift
//  Expert Assessment
//
//  Created by verofieiev on 10/12/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation

class ExpertGroup {
    let experts: [ExpertAppraisal]
    var name: String
    
    init(experts: [ExpertAppraisal], name: String) {
        self.experts = experts
        self.name = name
    }
    
    convenience init(random count: Int, name: String) {
        var exp = [ExpertAppraisal]()
        for _ in 0...count {
            exp.append(ExpertAppraisal.init(random: 10))
        }
        self.init(experts: exp, name: name)
    }
    
    /// Сумарна Точність управління та обчислень
    var summAccuracyOfControlAndComputing: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.accuracyOfControlAndComputing
        })
    }
    /// Сумарна Ступінь стандартності інтерфейсів
    var summDegreeOfStandardInterfaces: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.degreeOfStandardInterfaces
        })
    }
    /// Сумарна Функціональна повнота
    var summFunctionalCompleteness: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.functionalCompleteness
        })
    }
    /// Сумарна Стійкість до помилок
    var summErrorsResilience: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.errorsResilience
        })
    }
    /// Сумарна Можливість розширення
    var summExpandAbility: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.expandAbility
        })
    }
    /// Сумарна Зручність роботи
    var summWorkConvenience: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.workConvenience
        })
    }
    /// Сумарна Простота роботи
    var summWorkSimplicity: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.workSimplicity
        })
    }
    /// Сумарна Відповідність чинним стандартам
    var summStandardsCompliance: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.standardsCompliance
        })
    }
    /// Сумарна Переносимість між ПЗ
    var summSoftwarePortability: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.softwarePortability
        })
    }
    /// Сумарна Зручність навчання
    var summStudyConvenience: Float {
        return experts.reduce(0.0, { (current, expert) -> Float in
            return current+expert.studyConvenience
        })
    }
    
    /// Середня Точність управління та обчислень
    var averageAccuracyOfControlAndComputing: Float {
        return summAccuracyOfControlAndComputing / Float(experts.count)
    }
    /// Середня Ступінь стандартності інтерфейсів
    var averageDegreeOfStandardInterfaces: Float {
        return summDegreeOfStandardInterfaces / Float(experts.count)
    }
    /// Середня Функціональна повнота
    var averageFunctionalCompleteness: Float {
        return summFunctionalCompleteness / Float(experts.count)
    }
    /// Середня Стійкість до помилок
    var averageErrorsResilience: Float {
        return summErrorsResilience / Float(experts.count)
    }
    /// Середня Можливість розширення
    var averageExpandAbility: Float {
        return summExpandAbility / Float(experts.count)
    }
    /// Середня Зручність роботи
    var averageWorkConvenience: Float {
        return summWorkConvenience / Float(experts.count)
    }
    /// Середня Простота роботи
    var averageWorkSimplicity: Float {
        return summWorkSimplicity / Float(experts.count)
    }
    /// Середня Відповідність чинним стандартам
    var averageStandardsCompliance: Float {
        return Float(summStandardsCompliance) / Float(experts.count)
    }
    /// Середня Переносимість між ПЗ
    var averageSoftwarePortability: Float {
        return summSoftwarePortability / Float(experts.count)
    }
    /// Середня Зручність навчання
    var averageStudyConvenience: Float {
        return summStudyConvenience / Float(experts.count)
    }
    
    func toExpertAppraisal() -> ExpertAppraisal {
        return ExpertAppraisal(accuracyOfControlAndComputing: averageAccuracyOfControlAndComputing,
                               degreeOfStandardInterfaces: averageDegreeOfStandardInterfaces,
                               functionalCompleteness: averageFunctionalCompleteness,
                               errorsResilience: averageErrorsResilience,
                               expandAbility: averageExpandAbility,
                               workConvenience: averageWorkConvenience,
                               workSimplicity: averageWorkSimplicity,
                               standardsCompliance: averageStandardsCompliance,
                               softwarePortability: averageSoftwarePortability,
                               studyConvenience: averageStudyConvenience)
    }
}

class ExpertGroupTable: ExpertGroup {
    let industryExperts: ExpertAppraisal
    let usabilityExperts: ExpertAppraisal
    let softwareExperts: ExpertAppraisal
    let enduserExperts: ExpertAppraisal
    
    init(name: String,
         industryExperts: ExpertAppraisal,
         usabilityExperst: ExpertAppraisal,
         softwareExperts: ExpertAppraisal,
         enduserExperts: ExpertAppraisal) {
        self.industryExperts = industryExperts
        self.usabilityExperts = usabilityExperst
        self.softwareExperts = softwareExperts
        self.enduserExperts = enduserExperts
        super.init(experts: [industryExperts,
                             usabilityExperst,
                             softwareExperts,
                             enduserExperts],
                   name: name)
    }
    
    func averageApprisal(weight: ExpertWeight) -> ExpertAppraisal {
        
        let avgSumm = industryExperts * weight.industry +
                      usabilityExperts * weight.usability +
                      softwareExperts * weight.software +
                      enduserExperts * weight.enduser

        return avgSumm / weight.summ
    }
    
    static func *(lhs: ExpertGroupTable, rhs: ExpertGroupTable) -> ExpertGroupTable {
        
        return ExpertGroupTable(name: "",
                                industryExperts: lhs.industryExperts * rhs.industryExperts,
                                usabilityExperst: lhs.usabilityExperts * rhs.usabilityExperts,
                                softwareExperts: lhs.softwareExperts * rhs.softwareExperts,
                                enduserExperts: lhs.enduserExperts * rhs.enduserExperts)
    }
}
