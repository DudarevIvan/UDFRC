//
//  Screen.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import SwiftUI

struct Screen: Identifiable, Equatable {
    
    let id: String = UUID().uuidString
    let nextScreen: AnyView
    
    static func ==(lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}
