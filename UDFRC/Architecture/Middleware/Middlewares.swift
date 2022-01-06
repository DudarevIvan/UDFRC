//
//  Middlewares.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import Foundation
import Combine

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>


let sportList: Middleware<SportState, SportAction> = { state, action in
    var state = state
    switch action {
        case .getCurrendDate:
            let date: Date = .now
            return Future<SportAction, Never> { actions in
                // Simulated network latency
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    actions(.success(SportAction.showCurrentDate(date)))
                }
            }
            .eraseToAnyPublisher()
        default:
            return Empty()
                .eraseToAnyPublisher()
            
    }
}
