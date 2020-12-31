//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var displayLabel: UILabel!
  
  private var isFinishedTypungNumber: Bool = true
  private var displayValue: Double {
    get {
      guard let number = Double(displayLabel.text!) else {
        fatalError("cannot convert display label text to a double")
      }
      return number
    }
    set {
      displayLabel.text = String(newValue)
    }
  }
  
  private var calculator = CalculatorLogic()
  
  @IBAction func calcButtonPressed(_ sender: UIButton) {
    
    //What should happen when a non-number button is pressed
    isFinishedTypungNumber = true
    
    calculator.setNumber(displayValue)
    
    if let calcMethod = sender.currentTitle {
      if let result = calculator.calculate(symbol: calcMethod) {
      displayValue = result
      }
     
    }
    
  }
  
  
  @IBAction func numButtonPressed(_ sender: UIButton) {
    
    //What should happen when a number is entered into the keypad
    
    if let numValue = sender.currentTitle {
      if isFinishedTypungNumber {
        displayLabel.text = numValue
        isFinishedTypungNumber = false
      } else {
        displayLabel.text = displayLabel.text! + numValue
      }
    }
    
  }
  
}

