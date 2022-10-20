//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var calculatorController = CalculatorBrain()
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        if sender.currentTitle! == "Calculate"
        {
            
            calculatorController.bill = Float(billText.text!) ?? 0.0
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        else
        {
            zeroButton.isSelected = false
            tenButton.isSelected = false
            twentyButton.isSelected = false
            
            switch sender.tag {
            case 0:
                calculatorController.percent = 1.00
            case 10:
                calculatorController.percent = 1.10
            case 20:
                calculatorController.percent = 1.20
            default:
                print("Error")
            }
            
            billText.endEditing(true)
            sender.isSelected = true
        }
        
    }
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        counterLabel.text = String(Int(sender.value))
        calculatorController.person = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.tip = Float(calculatorController.getBill()) / Float(calculatorController.getPerson()) * calculatorController.getPercent()

            destinationVC.person = calculatorController.getPerson()
            
            destinationVC.percent = calculatorController.getPercent()
        }

    }
}

