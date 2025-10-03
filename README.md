# 🧮 Expression Calculator

A simple math expression calculator written in Swift. This project parses infix expressions like `3 + 4 * (2 - 1)`, 
converts them to Reverse Polish Notation (RPN) using the Shunting Yard algorithm, and evaluates the result.

---

## 🚀 Features

- Supports basic arithmetic operators: `+`, `-`, `*`, `/`, `^`
- Handles parentheses
- Uses the Shunting Yard algorithm to convert infix to postfix notation
- Evaluates expressions using a stack-based approach
- Built with Swift `struct`, `dictionary`, and `functions`

---

## 🧠 What I Learned

- How to tokenize mathematical expressions in Swift
- Implementing the Shunting Yard algorithm
- Stack-based evaluation of postfix (RPN) expressions
- Organizing Swift code in a modular and readable way

---

## 📦 Example

```swift
let calculator = ExpressionCalculator()
let result = calculator.evaluatePolishNotation(expression: "3 + 4 * (2 - 1)")
print(result) // Output: 7.0
