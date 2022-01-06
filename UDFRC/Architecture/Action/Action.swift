//
//  Action.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import Foundation
import SwiftUI

// Routing
protocol RoutingAction {
    static func forward(_: AnyView) -> Self
    static var back: Self { get }
    static var home: Self { get }
}

// Sport Action
enum SportAction: RoutingAction {
    // Routing
    case forward(AnyView)
    case back
    case home
    
    case getCurrendDate
    case showCurrentDate(Date)
    case getSportList
    case showSportList(Array<String>)
}

// Result Action
enum DateAction: RoutingAction {
    // Routing
    case forward(AnyView)
    case back
    case home
    
    case getResult
}

// Settings Action
enum SettingsAction: RoutingAction {
    // Routing
    case forward(AnyView)
    case back
    case home
    
    case getUserSettings
}
