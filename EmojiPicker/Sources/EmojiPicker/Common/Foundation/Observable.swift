//
//  Observable.swift
//  
//
//  Created by Егор Бадмаев on 17.07.2022.
//

import Foundation

final class Observable<T> {
    typealias Listener = (T) -> Void
    
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: Listener?
    
    init(value: T) {
        self.value = value
    }
    
    public func bind(_ listener: @escaping Listener) {
        self.listener = listener
    }
}
