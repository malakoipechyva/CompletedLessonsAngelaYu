//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by malakoipechyva on 10/31/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
  
  var bmi: BMI?
  
  func getBMIValue() -> String {
    let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
    return bmiTo1DecimalPlace
  }
  
  func getAdvice() -> String {
    return bmi?.advice ?? "No advice"
  }
  
  func getColor() -> UIColor {
    return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  }
  
  mutating func calculateBMI(height: Float, weight: Float) {
     let bmiValue = weight / pow(height, 2)
    if bmiValue < 18.5 {
      bmi = BMI(value: bmiValue, advice: "Eat more", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
    } else if bmiValue < 24.9 {
      bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
    } else {
      bmi = BMI(value: bmiValue, advice: "Eat less", color: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
    }
   
  }
}
