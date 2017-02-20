//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Dulio Denis on 2/19/17.
//  Copyright © 2017 ddApps. All rights reserved.
//

import Foundation

// global function
func changeSign(operand: Double) -> Double {
    return -operand
}

struct CalculatorBrain {
    
    // optional on initialization = not set
    private var accumulator: Double?
    
    // private enum specifying operation types
    // with an associated value
    private enum Operation {
        case constant(Double)
        case unary((Double) -> Double)
    }
    
    // private dictionary of operations
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unary(sqrt),
        "cos" : Operation.unary(cos),
        "±" : Operation.unary(changeSign)
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unary(let f):
                if accumulator != nil {
                    accumulator = f(accumulator!)
                }
            }
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
