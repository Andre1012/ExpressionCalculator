//
//  ExpressionCalculator.swift
//  ExpressionCalculator
//
//  Created by César André García León on 01/10/25.
//

import Foundation

struct ExpressionCalculator {
    let precedence: [String: (Int, String)] = [
        "+": (1, "L"),
        "-": (1, "L"),
        "*": (2, "L"),
        "/": (2, "L"),
        "^": (3, "R")
    ]
    
    func toPolishNotation(_ expression: String) -> String{
        var output = [String]()
        var operators = [String]()
        
        let tokens = expression.replacingOccurrences(of: " ", with: "")
        
        for token in tokens{
            if token.isNumber{
                output.append(String(token))
            }
            else if let (prec, assoc) = precedence[String(token)]{
                while let lastOp = operators.last, let (lastPrec, _) = precedence[lastOp], (assoc == "L" && prec <= lastPrec) || (assoc == "R" && prec < lastPrec){
                    output.append(operators.removeLast())
                }
                operators.append(String(token))
            }
            else if token == "("{
                operators.append(String(token))
            }
            else if token == ")"{
                while let lastOp = operators.last, lastOp != "("{
                    output.append(operators.removeLast())
                }
                operators.removeLast()
            }
        }
        while let _ = operators.last {
            output.append(operators.removeLast())
        }
        
        return output.joined(separator: " ")
    }
    
    
    func evaluatePolishNotation(_ expression: String) -> Double {
        let polishReversedExpression = toPolishNotation(expression)
        let tokens = polishReversedExpression.split(separator: " ").map(String.init)
        var numbersStack = [Double]()
        
        for token in tokens{
            if let number = Double(token) {
                numbersStack.append(number)
            }
            else if let right = numbersStack.popLast(), let left = numbersStack.popLast(){
                let result: Double
                switch token {
                case "+": result = left + right
                case "-": result = left - right
                case "*": result = left * right
                case "/": result = left / right
                case "^": result = pow(left, right)
                default: print("Error: operador no válido '\(token)'")
                    return Double.nan
                }
                numbersStack.append(result)
            }
            else{
                print("Error: expresión inválida")
                return Double.nan
            }
        }
        return numbersStack.count == 1 ? numbersStack[0] : Double.nan
    }
}
