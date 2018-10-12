//
//  PredefinedValues.swift
//  Expert Assessment
//
//  Created by hell_ghost on 10/12/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation

struct SingleValues: Codable {
    var industry: ExpertAppraisal
    var usability: ExpertAppraisal
    var software: ExpertAppraisal
    var enduser: ExpertAppraisal
}

struct MultyValues: Codable {
    var industry: [ExpertAppraisal]
    var usability: [ExpertAppraisal]
    var software: [ExpertAppraisal]
    var enduser: [ExpertAppraisal]
}

struct PredefinedValues: Codable {
    var startValues: SingleValues
    var expertsAppraisal: MultyValues?
}
