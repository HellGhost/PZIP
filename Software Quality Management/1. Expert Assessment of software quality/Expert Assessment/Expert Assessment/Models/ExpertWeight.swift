//
//  ExpertWeight.swift
//  Expert Assessment
//
//  Created by verofieiev on 10/31/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import Foundation

struct ExpertWeight {
    let industry: Float
    let usability: Float
    let software: Float
    let enduser: Float

    var summ: Float {
        return industry+usability+software+enduser
    }
}
