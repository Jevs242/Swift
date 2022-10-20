//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Jose Velazquez on 10/5/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi:BMI?
    
    mutating func calculateBMI(height:Float , weight:Float)
    {
        let bmiValue = weight / pow(height , 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        }
        else if bmiValue > 18.5 && bmiValue < 24.9
        {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .green)
        }
        else if bmiValue > 24.9
        {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .red)
        }
    }
    
    func getBMIValue()->String
    {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice()->String
    {
        return bmi?.advice ?? ""
    }
    
    func getColor()->UIColor
    {
        return bmi?.color ?? .white
    }
    
}
