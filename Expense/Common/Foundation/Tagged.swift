//
//  Tagged.swift
//  Expense
//
//  Created by Егор Бадмаев on 11.07.2022.
//

/// Generic-structure, that have two parameters:
/// - Parameters:
///   - Tag: This type is not used anywhere, but allows you to distinguish 2 models with the same `RawValue` types at the compilation stage
///   - RawValue: Type of what lies inside this structure
struct Tagged<Tag, RawValue> {
    let rawValue: RawValue
    
    init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}
