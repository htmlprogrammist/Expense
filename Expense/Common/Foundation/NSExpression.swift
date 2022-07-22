//
//  NSExpression.swift
//  Expense
//
//  Created by Егор Бадмаев on 21.07.2022.
//

import Foundation

extension NSExpression {
    /**
     Allows `expressionValue(with:, context:)` method to assume Doubles instead of Ints
     
     Look at the example:
     ```
     let expression2 = NSExpression(format: "3*3 / 2")
     expression2.expressionValue(with: nil, context: nil) // Optional(4)
     
     let expression3 = NSExpression(format: "3*3 / 2")
     print(expression3.toFloatingPoint().expressionValue(with: nil, context: nil)) // Optional(4.5)
     ```
     */
    func toFloatingPoint() -> NSExpression {
        switch expressionType {
        case .constantValue:
            if let value = constantValue as? NSNumber {
                return NSExpression(forConstantValue: NSNumber(value: value.doubleValue))
            }
        case .function:
            let newArgs = arguments.map { $0.map { $0.toFloatingPoint() } }
            return NSExpression(forFunction: operand, selectorName: function, arguments: newArgs)
        case .conditional:
            return NSExpression(forConditional: predicate, trueExpression: self.true.toFloatingPoint(), falseExpression: self.false.toFloatingPoint())
        case .unionSet:
            return NSExpression(forUnionSet: left.toFloatingPoint(), with: right.toFloatingPoint())
        case .intersectSet:
            return NSExpression(forIntersectSet: left.toFloatingPoint(), with: right.toFloatingPoint())
        case .minusSet:
            return NSExpression(forMinusSet: left.toFloatingPoint(), with: right.toFloatingPoint())
        case .subquery:
            if let subQuery = collection as? NSExpression {
                return NSExpression(forSubquery: subQuery.toFloatingPoint(), usingIteratorVariable: variable, predicate: predicate)
            }
        case .aggregate:
            if let subExpressions = collection as? [NSExpression] {
                return NSExpression(forAggregate: subExpressions.map { $0.toFloatingPoint() })
            }
        case .anyKey:
            fatalError("anyKey not yet implemented")
        case .block:
            fatalError("block not yet implemented")
        case .evaluatedObject, .variable, .keyPath:
            break // Nothing to do here
        /// Switch covers known cases, but `NSExpression.ExpressionType` may have additional unknown values, possibly added in future versions. So to handle them, we implement `@unknown default`
        @unknown default:
            break
        }
        return self
    }
}
