//
//  calculatorBrain.swift
//  BMI Calculator
//
//  Created by Wrichy Reyes on 6/6/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct calculatorBrain{
    
    var bmi: BMI?
    
     mutating func calculateBMI(height: Float, weight: Float){
        let value = weight/(pow(height, 2))
        if(value < 18.5){
            
            bmi = BMI(value: value, advice: "Eat pies", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }
        else if(value < 24.9){
            
            bmi = BMI(value: value, advice: "fit", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        }
        else {
            bmi = BMI(value: value, advice: "Eat veggies", color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        }
        
    }
    func getBMIValue()-> String{
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.gray
    }
    
    
    
}
