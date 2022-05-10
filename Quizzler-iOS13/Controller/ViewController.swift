//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progessBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI();
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!; // True / False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        // Checking the answer
        if (userGotItRight) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion();
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false);
        
        
        
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText();
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //            self.trueButton.backgroundColor = UIColor.clear;
        //            self.falseButton.backgroundColor = UIColor.clear;
        //        }
        
        scoreLabel.text = "Score: \(quizBrain.getScore())";
        
        trueButton.backgroundColor = UIColor.clear;
        falseButton.backgroundColor = UIColor.clear;
        
        // Showing the progress bar based on the number of questions answered
        progessBar.progress = quizBrain.getProgress();
    }
    
    
    
    
    
    
    
    
}

