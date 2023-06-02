//
//  ViewController.swift
//  BMI Calculator
//
//  Course by Angela Yu on 21/08/2019.
// Modified by Richard Reyes
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calcBrain = calculatorBrain()
   // var bmi = "0.0"
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightActionChange(_ sender: UISlider) {
        
        print(String(format: "%.2f", sender.value))
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
        
    }
    
    @IBAction func weightActionChange(_ sender: UISlider) {
        print(Int(sender.value))
        weightLabel.text = String(Int(sender.value)) + "Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        calcBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        print(weightSlider.value/(pow(heightSlider.value, 2)))
        //bmi = 
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResults"){
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calcBrain.getBMIValue()
            destinationVC.advice = calcBrain.getAdvice()
            destinationVC.color = calcBrain.getColor()
        }
    }
}

