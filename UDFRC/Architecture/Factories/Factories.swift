//
//  Factories.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import Foundation
import SwiftUI

// Public
let screenFactory: ScreenFactory = .init()

// Screen factory
final class ScreenFactory {
    
    fileprivate let storeFactory: StoreFactory = .init()
    fileprivate init() {}
    
    func makeSportScreen() -> SportScreen {
        SportScreen(sportStore: storeFactory.sportStore)
    }
    
    func makeDateScreen() -> DateScreen {
        DateScreen(dateStore: storeFactory.dateStore)
    }
    
    func makeSettingsScreen() -> SettingsScreen {
        SettingsScreen(settingsStore: storeFactory.settingsStore)
    }
}


// Store factory
final class StoreFactory {
    
    init() {
        self.sportStore = .init(initialState: .start, reducer: reducer(_:action:), middlewares: [sportList])
        self.settingsStore = .init(initialState: .loading, reducer: reducer(_:action:), middlewares: [])
    }
    
    fileprivate let sportStore: SportStore
    
    fileprivate let settingsStore: SettingsStore
    
    // Always reinit
    fileprivate var dateStore: DateStore {
        DateStore.init(initialState: .loading, reducer: reducer(_:action:), middlewares: [])
    }
}


// Routing
final class RouterFactory {
    static let shared: RouterFactory = .init()
    private init() {}
    
    let routerViewModel: RouterViewModel = RouterViewModel(with: .easeInOut(duration: 0.33))
}
