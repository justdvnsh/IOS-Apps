//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value))
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value)
    }
    
    var bmi = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let value = weightSlider.value / pow(heightSlider.value, 2)
        bmi = String(format: "%.2f", value)
//        let secondViewController = SecondViewController()
//        secondViewController.bmiValue = String(format: "%.1f", bmi)
//        self.present(secondViewController, animated: true, completion: nil)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let dest = segue.destination as! ResultViewController
            dest.bmiValue = bmi
        }
    }
}

