//
//  ViewController.swift
//  Expert Assessment
//
//  Created by verofieiev on 10/12/18.
//  Copyright © 2018 Vladyslav Yerofieiev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentView: UIView?
    var avgView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.path(forResource: "PredefinedValues", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let predefined = try? JSONDecoder().decode(PredefinedValues.self, from: data) else {
            return
        }
        let initialCreterials = ExpertGroupTable(name: "Табл. 1. Відібрані критерії та початкові вагові коефіцієнти експертів за кожним критерієм оцінювання",
                                                 industryExperts: ExpertAppraisal.init(random: 10),
                                                 usabilityExperst: ExpertAppraisal.init(random: 10),
                                                 softwareExperts:  ExpertAppraisal.init(random: 10),
                                                 enduserExperts: ExpertAppraisal.init(random: 10))
        
//        let industry = ExpertGroup(experts: predefined.expertsAppraisal!.industry,
//                                        name: "Експерт галузі").toExpertAppraisal()
//        let usability = ExpertGroup(experts: predefined.expertsAppraisal!.usability,
//                                        name: "Експерт юзабіліті").toExpertAppraisal()
//        let software = ExpertGroup(experts: predefined.expertsAppraisal!.software,
//                                        name: "Експерт з програмування").toExpertAppraisal()
//        let enduser = ExpertGroup(experts: predefined.expertsAppraisal!.enduser,
//                                        name: "Потенційні користувачі").toExpertAppraisal()
        
        let industry = ExpertGroup(random: Int.random(in: 20...100),
                                   name: "Експерт галузі").toExpertAppraisal()
        let usability =  ExpertGroup(random: Int.random(in: 20...100),
                                     name: "Експерт юзабіліті").toExpertAppraisal()
        let software =  ExpertGroup(random: Int.random(in: 20...100),
                                    name: "Експерт з програмування").toExpertAppraisal()
        let enduser =  ExpertGroup(random: Int.random(in: 20...100),
                                   name: "Потенційні користувачі").toExpertAppraisal()
        
        let expertAppraisal = ExpertGroupTable(name: "Оцінки експертів",
                                               industryExperts: industry,
                                               usabilityExperst: usability,
                                               softwareExperts: software,
                                               enduserExperts: enduser)
        
        let weight = ExpertWeight(industry: 0.7,
                                  usability: 0.8,
                                  software: 0.9,
                                  enduser: 0.5)
        
        let averageApprisal = initialCreterials * expertAppraisal
        averageApprisal.name = "Табл. 3. Оцінки експертів за кожним критерієм оцінювання та їхні усереднені значення"
        
        let avgValues = averageApprisal.averageApprisal(weight: weight)
        
        var output = DiagrammCalculator.calculateDiagramm(base: initialCreterials.industryExperts,
                                                             avg: averageApprisal.industryExperts,
                                                             weight: weight.industry)
        
        let industryWebDiagramm = WebDiagrammView(triangles: output.triangles,
                                          square: output.square,
                                          name: "Галузі")
        
        industryWebDiagramm.backgroundColor = .clear
        industryWebDiagramm.center = CGPoint(x: 200, y: 200)
        contentView?.addSubview(industryWebDiagramm)
        
        output = DiagrammCalculator.calculateDiagramm(base: initialCreterials.usabilityExperts,
                                                      avg: averageApprisal.usabilityExperts,
                                                      weight: weight.usability)
        
        let usabilityWebDiagramm = WebDiagrammView(triangles: output.triangles,
                                                  square: output.square,
                                                  name: "Юзабіліті")
        
        usabilityWebDiagramm.backgroundColor = .clear
        usabilityWebDiagramm.polygonColor = UIColor.green
        usabilityWebDiagramm.center = CGPoint(x: 600, y: 200)
        contentView?.addSubview(usabilityWebDiagramm)
        
        output = DiagrammCalculator.calculateDiagramm(base: initialCreterials.softwareExperts,
                                                      avg: averageApprisal.softwareExperts,
                                                      weight: weight.software)
        
        let softwareWebDiagramm = WebDiagrammView(triangles: output.triangles,
                                                   square: output.square,
                                                   name: "Програмування")
        
        softwareWebDiagramm.backgroundColor = .clear
        softwareWebDiagramm.polygonColor = UIColor.blue
        softwareWebDiagramm.center = CGPoint(x: 1000, y: 200)
        contentView?.addSubview(softwareWebDiagramm)
        
        output = DiagrammCalculator.calculateDiagramm(base: initialCreterials.enduserExperts,
                                                      avg: averageApprisal.enduserExperts,
                                                      weight: weight.enduser)
        
        let enduserWebDiagramm = WebDiagrammView(triangles: output.triangles,
                                                  square: output.square,
                                                  name: "Користувачі")
        
        enduserWebDiagramm.backgroundColor = .clear
        enduserWebDiagramm.polygonColor = UIColor.yellow
        enduserWebDiagramm.center = CGPoint(x: 1400, y: 200)
        contentView?.addSubview(enduserWebDiagramm)
        
    
        output = DiagrammCalculator.calculateDiagramm(base: initialCreterials.toExpertAppraisal(),
                                                      avg: avgValues,
                                                      weight: 1.0)
        
        let avgWebDiagramm = WebDiagrammView(triangles: output.triangles,
                                                 square: output.square,
                                                 name: "Усереднені")
        
        avgWebDiagramm.backgroundColor = .clear
        avgWebDiagramm.polygonColor = UIColor.purple
        avgWebDiagramm.center = CGPoint(x: 1800, y: 200)
        contentView?.addSubview(avgWebDiagramm)
        
        (contentView?.superview as? UIScrollView)?.isPagingEnabled = true
    }
}
