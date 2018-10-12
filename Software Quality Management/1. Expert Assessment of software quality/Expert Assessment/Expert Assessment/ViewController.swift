//
//  ViewController.swift
//  Expert Assessment
//
//  Created by verofieiev on 10/12/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.path(forResource: "PredefinedValues", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let predefined = try? JSONDecoder().decode(PredefinedValues.self, from: data) else {
            return
        }
        
        let industryExpert = ExpertAppraisal(accuracyOfControlAndComputing: 8.0,
                                             degreeOfStandardInterfaces: 5.0,
                                             functionalCompleteness: 10.0,
                                             errorsResilience: 6.0,
                                             expandAbility: 5.0,
                                             workConvenience: 9.0,
                                             workSimplicity: 9.0,
                                             standardsCompliance: 6.0,
                                             softwarePortability: 8.0,
                                             studyConvenience: 7)
        
//        let data = try? JSONEncoder().encode(industryExpert)
      
//        try? data?.write(to: URL(fileURLWithPath: "/Users/hell_ghost/PZIP/Software Quality Management/1. Expert Assessment of software quality/Expert Assessment/Expert Assessment/Predefined.json"))
        let usabilityExpert = ExpertAppraisal(accuracyOfControlAndComputing: 5.0,
                                              degreeOfStandardInterfaces: 9.0,
                                              functionalCompleteness: 6.0,
                                              errorsResilience: 5.0,
                                              expandAbility: 5.0,
                                              workConvenience: 9.0,
                                              workSimplicity: 7.0,
                                              standardsCompliance: 5.0,
                                              softwarePortability: 6.0,
                                              studyConvenience: 8)
        
        let programmingExpert = ExpertAppraisal(accuracyOfControlAndComputing: 9.0,
                                                degreeOfStandardInterfaces: 6.0,
                                                functionalCompleteness: 9.0,
                                                errorsResilience: 10.0,
                                                expandAbility: 10.0,
                                                workConvenience: 7.0,
                                                workSimplicity: 6.0,
                                                standardsCompliance: 10.0,
                                                softwarePortability: 9.0,
                                                studyConvenience: 6)
        
        let userExpert = ExpertAppraisal(accuracyOfControlAndComputing: 7.0,
                                         degreeOfStandardInterfaces: 5.0,
                                         functionalCompleteness: 6.0,
                                         errorsResilience: 7.0,
                                         expandAbility: 4.0,
                                         workConvenience: 10.0,
                                         workSimplicity: 10.0,
                                         standardsCompliance: 5.0,
                                         softwarePortability: 6.0,
                                         studyConvenience: 10)
        
        var initialCreterials = ExpertGroupTable(experts: [industryExpert, usabilityExpert, programmingExpert, userExpert],
                                                 name: "Відібрані критерії та початкові вагові коефіцієнти експертів за кожним критерієм оцінювання")
        
    }
}

