//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QuestionText: UILabel!
    
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    
    
    @IBOutlet weak var Progress: UIProgressView!
    
    var questionCount = 0
    
    var questions = [
        Question(q: "Is swift a lang ?", a: "True"),
        Question(q: "Is html is a lang ?", a: "False"),
        Question(q: "Is kotlin a lang ?", a: "True"),
        Question(q: "Is css is a lang ?", a: "False"),
        Question(q: "Is java a lang ?", a: "True"),
        Question(q: "Is sass is a lang ?", a: "False"),
        Question(q: "Is c++ a lang ?", a: "True"),
        Question(q: "Is jquery is a lang ?", a: "False"),
        Question(q: "Is python a lang ?", a: "True"),
        Question(q: "Is xcode is a lang ?", a: "False"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func AnswerButton(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle
        let currentAns = questions[questionCount].a
        
        if buttonPressed == currentAns {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionCount + 1 < questions.count {
            questionCount += 1
        } else {
            questionCount = 0
        }
        
        
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false)
    }
    
    @objc func updateUI() {
        QuestionText.text = questions[questionCount].q
        TrueButton.backgroundColor = UIColor.clear
        FalseButton.backgroundColor = UIColor.clear
        Progress.progress = Float(questionCount + 1) / Float(questions.count)
    }
    
}

