//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Dulio Denis on 2/19/17.
//  Copyright © 2017 ddApps. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    // optional on initialization = not set
    private var accumulator: Double?
    
    mutating func performOperation(_ symbol: String) {
        switch symbol {
        case "π":
            accumulator = Double.pi
        case "√":
            if let operand = accumulator {
                accumulator = sqrt(operand)
            }
        default:
            break
        }
    }
    
    // mark method as mutating in order to assign to property
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    // return an optional since the accumulator can be not set
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
