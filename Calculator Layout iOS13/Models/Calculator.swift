//
//  Calculator.swift
//  Calculator Layout iOS13
//
//  Created by OmarAssidi on 12/11/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

enum Calculation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "÷"
    case mod = "%"
}

struct Calculator {
    var firstValue: String?
    var secondValue: String?
    var calculation: Calculation?
    var result: Float?
}
