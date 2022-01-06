//
//  Stack.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import Foundation

struct Stack {
    
    private var screens: Array<Screen> = .init()
    
    mutating func push(_ screen: Screen) {
        screens.append(screen)
    }
    
    mutating func pop() {
        _ = screens.popLast()
    }
    
    mutating func popToRoot() {
        screens.removeAll()
    }
    
    func topScreen() -> Screen? {
        screens.last
    }    
}
