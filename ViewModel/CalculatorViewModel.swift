//
//  CalculatorViewModel.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 24.04.2021.
//

import Foundation
import UIKit
class CalculatorViewModel : UIViewController{
    
    static func newLabelText(value: String){
        if label.text=="0"
        {
            label.text=value
        }
        else
        {
            label.text?.append(value)
        }
        isCalculatorAvailable = true
    }
    static func operationButton(value: String){
        if isCalculatorAvailable {
            if operation != ""
            {
                operationResult()
            }
            operation = value
            firstNumber = label.text!
            label.text = "0"
            isCalculatorAvailable = false
        }
        else{
            operation = value
        }
    }
    static func operationResult(){
        switch operation {
        case "/":
            let result = convertToString(String(Double(firstNumber)! / Double(label.text!)!))
            calculator.text = String(firstNumber + "/" + label.text! + "=" + result)
            label.text = result
            break
        case "*":
            let result = convertToString(String(Double(firstNumber)! * Double(label.text!)!))
            calculator.text = String(firstNumber + "*" + label.text! + "=" + result)
            label.text = result
            break
        case "+":
            let result = convertToString(String(Double(firstNumber)! + Double(label.text!)!))
            calculator.text = String(firstNumber + "+" + label.text! + "=" + result)
            label.text = result
            break
        case "-":
            let result = convertToString(String(Double(firstNumber)! - Double(label.text!)!))
            calculator.text = String(firstNumber + "-" + label.text! + "=" + result)
            label.text = result
            break
        default : break
        }
    }
    static func convertToString(_ value : String) -> String {
        let item = value.suffix(2)
        if item == ".0" {
            let result = value.replacingOccurrences(of: item, with: "")
            return result
        }
        return value
    }
    
}
