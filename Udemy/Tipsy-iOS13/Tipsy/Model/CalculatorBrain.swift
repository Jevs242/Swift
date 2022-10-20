//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Jose Velazquez on 10/7/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var person:Int = 2
    var bill:Float = 0.0
    var percent:Float = 1.10
    
    func getPercent() -> Float {
        return self.percent
    }
    
    func getPerson() -> Int {
        return self.person
    }
    
    func getBill() -> Float {
        return self.bill
    }
    
}
