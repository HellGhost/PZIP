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
        let initialCreterials = ExpertGroupTable(experts: [predefined.startValues.industry,
                                                           predefined.startValues.usability,
                                                           predefined.startValues.software,
                                                           predefined.startValues.enduser],
                                                 name: "Відібрані критерії та початкові вагові коефіцієнти експертів за кожним критерієм оцінювання")
        print(initialCreterials)
    }
}
