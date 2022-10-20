//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Jose Velazquez on 10/6/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var tip:Float = 0.0
    var person:Int = 2
    var percent:Float = 10
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", tip)
        var percentFix:Int = 0
        
        switch percent {
        case 1.00:
            percentFix = 0
        case 1.10:
            percentFix = 10
        case 1.20:
            percentFix = 20
        default:
            print("Error")
        }
        
        
        infoLabel.text = "Split between \(person) people, with \(String(percentFix))% tip."
        
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
