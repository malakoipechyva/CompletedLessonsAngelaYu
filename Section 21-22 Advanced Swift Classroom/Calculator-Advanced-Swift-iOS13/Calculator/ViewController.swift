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
    
  var isFinishedTypungNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
      isFinishedTypungNumber = true
    
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

