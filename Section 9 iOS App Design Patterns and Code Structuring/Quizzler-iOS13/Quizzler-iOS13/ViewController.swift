//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressLabel: UIProgressView!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  let quiz = [ ["First question", "True"],
               ["SecondQuestion", "False"],
               ["Third Question", "True"]
  ]
  var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       UpdateUI()
    }

  @IBAction func answerButtonPressed(_ sender: UIButton) {
    let userAnswer = sender.currentTitle
    let actualAnswer = quiz[questionNumber][1]
    
    if userAnswer == actualAnswer {
      print("Right!")
    } else {
      print("Wrong!")
    }
    if questionNumber + 1 < quiz.count {
      questionNumber += 1
    } else {
      questionNumber = 0
    }
    UpdateUI()
  }
  
  func UpdateUI() {
    questionLabel.text = quiz[questionNumber][0]
  }
}

