//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    private var calculatorBrain = CalculatorBrain.getInstance()
    private var displayValue: Float {
        get {
            guard let number = Float(displayLabel.text!) else {
                fatalError("Cannot convert \(String(describing: displayLabel.text)) to Float")
            }
            return number
        }
        set {
            if newValue == newValue.rounded() {
                displayLabel.text = String(Int(newValue))
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func controlClicked(_ sender: UIButton) {
        isFinishedTyping = true
        if sender.currentTitle == "AC" {
            CalculatorBrain.clear()
            calculatorBrain = CalculatorBrain.getInstance()
            displayLabel.text = "0"
        } else {
            displayValue *= -1
        }
    }
    
    
    @IBAction func calcPressed(_ sender: UIButton) {
        isFinishedTyping = true
        if sender.currentTitle == "=" {
            calculatorBrain.setSecondValue(String(displayValue))
            calculatorBrain.calculate()
            displayValue = calculatorBrain.getResult()
        } else {
            calculatorBrain.setFirstValue(String(displayValue))
            calculatorBrain.setCalculation(Calculation(rawValue: sender.currentTitle ?? "+") ?? .add)
        }
    }
    
    
    @IBAction func numPressed(_ sender: UIButton) {
        if isFinishedTyping {
            displayLabel.text = sender.currentTitle
            isFinishedTyping = false
        } else {
            displayLabel.text?.append(sender.currentTitle ?? "")
        }
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if displayLabel.text?.contains(".") == false {
            displayLabel.text?.append(sender.currentTitle ?? "")
            isFinishedTyping = false
        }
    }
}
