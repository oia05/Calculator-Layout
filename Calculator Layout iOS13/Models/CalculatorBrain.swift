//
//  CalculatorBrain.swift
//  Calculator Layout iOS13
//
//  Created by OmarAssidi on 12/11/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


class CalculatorBrain {
    private static var instance: CalculatorBrain? = nil
    var calculator: Calculator = Calculator()
    
    private init() {}
    
    static func getInstance() -> CalculatorBrain {
        if instance == nil {
            instance = CalculatorBrain()
        }
        return instance!
    }
    func setCalculation(_ calculation: Calculation) {
        calculator.calculation = calculation
    }
    
    func setFirstValue(_ value: String) {
        calculator.firstValue = value
    }
    
    func setSecondValue(_ value: String) {
        calculator.secondValue = value
    }
    
    func calculate() {
        let firstValue = calculator.firstValue
        let secondValue = calculator.secondValue
        var result: Float?
        if let firstValue = firstValue, let secondValue = secondValue {
            switch calculator.calculation?.rawValue {
            case Calculation.add.rawValue:
                result = (Float(firstValue) ?? 0.0 ) + (Float(secondValue) ?? 0.0 )
            case Calculation.subtract.rawValue:
                result = (Float(firstValue) ?? 0.0 ) - (Float(secondValue) ?? 0.0 )
            case Calculation.multiply.rawValue:
                result = (Float(firstValue) ?? 0.0 ) * (Float(secondValue) ?? 0.0 )
            case Calculation.divide.rawValue:
                if Float(secondValue) == 0.0 {
                    result = 0.0
                    return
                }
                result = (Float(firstValue) ?? 0.0 ) / (Float(secondValue) ?? 0.0 )
            case Calculation.mod.rawValue:
                if Float(secondValue) == 0.0 {
                    result = 0.0
                    return
                }
                let division = (Float(firstValue) ?? 0.0 ) / (Float(secondValue) ?? 0.0 )
                result = ( division - Float(Int(division)) ) * (Float(secondValue) ?? 0.0)
            default:
                result = (Float(firstValue) ?? 0.0 ) + (Float(secondValue) ?? 0.0 )
            }
        }
        let resultString = String(format: "%.3f", result ?? 0.0)
        setFirstValue(resultString)
        calculator.result = Float(resultString)
    }
    
    func getResult() -> Float {
        let (age, name) = example()
        return calculator.result ?? Float(calculator.secondValue ?? "0") ?? 0.0
    }
    
    static func clear() {
        instance = nil
    }
    
    func example() -> (age: Int, name: String) {
        return (12, "Omar")
    }
}
