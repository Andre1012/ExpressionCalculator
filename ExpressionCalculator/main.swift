//
//  main.swift
//  ExpressionCalculator
//
//  Created by César André García León on 01/10/25.
//

import Foundation

let calc = ExpressionCalculator()
let expression = "2^3^2"
let polishReverseExpression = calc.evaluatePolishNotation(expression)

print("The result of the expression \(expression) is: \(polishReverseExpression)")


