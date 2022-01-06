//
//  Reducer.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import Foundation
import Combine
import SwiftUI

typealias Reducer<State, Action> = (State, Action) -> State

//MARK: Sport
func reducer(_ state: SportState, action: SportAction) -> SportState {
    
    var state = state
    let router = RouterFactory.shared.routerViewModel
    
    switch action {
        case .getSportList:
            state = .data(MockFile.sportList)
        case .showSportList(let list):
            state = .data(list)
            
        case .getCurrendDate:
            break
        case .showCurrentDate(let date):
            state = .currentDate(date)
            
        case .forward(let screen):
            router.push(screen)
        case .back:
            router.pop()
        case .home:
            router.popToRoot()
    }
    
    return state
}


//MARK: Date
func reducer(_ state: DateState, action: DateAction) -> DateState {
    
    var state = state
    let serialQueue = DispatchQueue(label: "resultReducer")
    let router = RouterFactory.shared.routerViewModel
    
    switch action {
        case .getResult:
            serialQueue.sync {
                state = .data(MockFile.dateOfSportingEvent)
            }
        case .forward(let screen):
            router.push(screen)
        case .back:
            router.pop()
        case .home:
            router.popToRoot()
    }
    
    return state
}


//MARK: Settings
func reducer(_ state: SettingsState, action: SettingsAction) -> SettingsState {
    
    var state = state
    let serialQueue = DispatchQueue(label: "settingsReducer")
    let router = RouterFactory.shared.routerViewModel
    
    switch action {
        case .getUserSettings:
            serialQueue.sync {
                state = .data(MockFile.userSettings)
            }
        case .forward(let screen):
            router.push(screen)
        case .back:
            router.pop()
        case .home:
            router.popToRoot()
    }
    
    return state
}
