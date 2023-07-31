//
//  ViewController.swift
//  Quizz
//
//  Created by Ahmed Alaa on 13/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    //Mark: - Outlets.
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //Mark: - Propreties.
    var quizBrain = QuizBrain()
  
    //Mark: - LifeCycle Method.
    override func viewDidLoad() {
        super.viewDidLoad()
        updatUI()
    }
    
    //Mark: - Actions.
    @IBAction func answerBtnTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
    
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updatUI), userInfo: nil, repeats: false)
    }
    
    //Mark: - Methods.
    @objc func updatUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

