//
//  ViewController.swift
//  AsyncMergeSorting
//
//  Created by verofieiev on 4/17/19.
//  Copyright © 2019 Vladyslav Yerofieiev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var array =  (0..<10).map{ _ in Int.random(in: 1...100)}
        print(array)
        sort(items: &array, processors: 1)
        print(array)
    }
}

