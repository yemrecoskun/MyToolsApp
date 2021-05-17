//
//  CalculatorViewController.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 24.04.2021.
//


import UIKit

class CalculatorViewController: UIViewController {
    var themeModelType = UserDefaults.standard.integer(forKey: "themeModelType")
    @IBOutlet weak var calculator: UILabel!
    @IBOutlet weak var label: UILabel!
    var pon = false
    var operation = ""
    var firstNumber = ""
    var isCalculatorAvailable = false
    override func viewDidLoad() {
        super.viewDidLoad()
        TDViewModel.changeTheme(themeModelType: self.themeModelType, view: view)
        // Do any additional setup after loading the view.
    }
    @IBAction func ponButton(_ sender: Any) {
        if(pon){
            label.text = String(label.text!.dropFirst())
            pon = false
        }
        else{
            label.text = "-"+label.text!
            pon = true
        }
    }
    @IBAction func percentateButton(_ sender: Any) {
        label.text = String(Double(label.text!)! / 100.0)
    }
    @IBAction func zeroButton(_ sender: Any) {
        newLabelText(value: "0")
    }
    @IBAction func oneButton(_ sender: Any) {
        newLabelText(value: "1")
    }
    @IBAction func twoButton(_ sender: Any) {
        newLabelText(value: "2")
    }
    @IBAction func threeButton(_ sender: Any) {
        newLabelText(value: "3")
    }
    @IBAction func fourButton(_ sender: Any) {
        newLabelText(value: "4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        newLabelText(value: "5")
    }
    @IBAction func sixButton(_ sender: Any) {
        newLabelText(value: "6")
    }
    @IBAction func sevenButton(_ sender: Any) {
        newLabelText(value: "7")
    }
    @IBAction func eightButton(_ sender: Any) {
        newLabelText(value: "8")
    }
    @IBAction func nineButton(_ sender: Any) {
        newLabelText(value: "9")
    }
    @IBAction func commasButton(_ sender: Any) {
        if label.text!.contains(".") == false
        {
            label.text?.append(".")
        }
    }
    @IBAction func divisionButton(_ sender: Any) {
        operationButton(value: "/")
    }
    @IBAction func multiplicationButton(_ sender: Any) {
        operationButton(value: "*")
    }
    @IBAction func subtractionButton(_ sender: Any) {
        operationButton(value: "-")
    }
    @IBAction func additionButton(_ sender: Any) {
        operationButton(value: "+")
    }
    @IBAction func resultButton(_ sender: Any) {
        operationResult()
        operation = ""
    }
    @IBAction func clearButton(_ sender: Any) {
        label.text="0"
        isCalculatorAvailable = false
    }
    @IBAction func clearAll(_ sender: Any) {
        label.text="0"
        firstNumber = ""
        operation = ""
        calculator.text = "0"
        isCalculatorAvailable = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newLabelText(value: String){
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
    func operationButton(value: String){
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
    func operationResult(){
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
    func convertToString(_ value : String) -> String {
        let item = value.suffix(2)
        if item == ".0" {
            let result = value.replacingOccurrences(of: item, with: "")
            return result
        }
        return value
    }
}
