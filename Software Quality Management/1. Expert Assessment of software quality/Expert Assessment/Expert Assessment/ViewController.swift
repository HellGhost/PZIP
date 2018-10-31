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
        let initialCreterials = ExpertGroupTable(name: "Відібрані критерії та початкові вагові коефіцієнти експертів за кожним критерієм оцінювання",
                                                 industryExperts: predefined.startValues.industry,
                                                 usabilityExperst: predefined.startValues.usability,
                                                 softwareExperts:  predefined.startValues.software,
                                                 enduserExperts: predefined.startValues.enduser)
        
        let industry = ExpertGroup(experts: predefined.expertsAppraisal!.industry,
                                        name: "Експерт галузі").toExpertAppraisal()
        let usability = ExpertGroup(experts: predefined.expertsAppraisal!.usability,
                                        name: "Експерт юзабіліті").toExpertAppraisal()
        let software = ExpertGroup(experts: predefined.expertsAppraisal!.software,
                                        name: "Експерт з програмування").toExpertAppraisal()
        let enduser = ExpertGroup(experts: predefined.expertsAppraisal!.enduser,
                                        name: "Потенційні користувачі").toExpertAppraisal()
        
        let expertAppraisal = ExpertGroupTable(name: "Оцінки експертів",
                                               industryExperts: industry,
                                               usabilityExperst: usability,
                                               softwareExperts: software,
                                               enduserExperts: enduser)
        
    }
}
