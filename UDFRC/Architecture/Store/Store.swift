//
//  Store.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import Foundation
import Combine
import SwiftUI

typealias SportStore = Store<SportState, SportAction>
typealias DateStore = Store<DateState, DateAction>
typealias SettingsStore = Store<SettingsState, SettingsAction>

class Store<State, Action>: ObservableObject {
    
    // Published State
    @Published private(set) var state: State
    
    @EnvironmentObject var router: RouterViewModel
    
    // Middlewares
    private let middlewares: Array<Middleware<State, Action>>
    
    // Reducer
    private var reducer: Reducer<State, Action>
    
    // Save Published
    private var cancellableSet: Set<AnyCancellable> = []
    deinit {
        for cancell in cancellableSet {
            cancell.cancel()
        }
    }
    
    init(initialState state: State, reducer: @escaping Reducer<State, Action>, middlewares: Array<Middleware<State, Action>>) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    // Dispatcher
    func dispatch(_ action: Action) {
        DispatchQueue.main.async { [self] in
            self.state = reducer(self.state, action)
        }
        
        middlewares.forEach { middleware in
            middleware(state, action)
                .receive(on: RunLoop.main)
                .sink(receiveValue: dispatch)
                .store(in: &cancellableSet)
        }
    }
}
