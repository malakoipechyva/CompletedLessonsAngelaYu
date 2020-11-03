//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
  
  var tipPct = 0.0
  var numberOfPeople = 2
  var totalAmount = 0.0
  var finalResult = "0.0"

  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var splintNumberLabel: UILabel!
  

  @IBAction func tipChanged(_ sender: UIButton) {
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    
    sender.isSelected = true
    
    let buttonTitle = sender.currentTitle ?? "0%"
    let buttonTitleMinusPct = String(buttonTitle.dropLast())
    let titleAsNumber = Double(buttonTitleMinusPct)!
    tipPct = titleAsNumber / 100
    
    billTextField.endEditing(true)
    
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    splintNumberLabel.text = String(format: "%.0f", sender.value)
    numberOfPeople = Int(sender.value)
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    let bill = billTextField.text!
    if bill != "" {
      totalAmount = Double(bill)!
      let result = totalAmount * (1 + tipPct) / Double(numberOfPeople)
      finalResult = String(format: "%.2f", result)
    }
    self.performSegue(withIdentifier: "goToResult", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResult" {
      let destinationVC = segue.destination as! ResultsViewController
      destinationVC.result = finalResult
      destinationVC.split = numberOfPeople
      destinationVC.tip = Int(tipPct * 100)
    }
  }
  
}

