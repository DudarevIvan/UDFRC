//
//  Router.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import SwiftUI

struct Router<Content: View>: View {
    
    @EnvironmentObject var viewModel: RouterViewModel
    
    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)
    
    init(_ transition: Transition = .none, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        
        switch transition {
        case .custom(let screenTransition):
            self.transitions = (screenTransition, screenTransition)
        default:
            self.transitions = (.identity, .identity)
        }
    }
    
    var body: some View {
        let isRootView = (viewModel.currentScreen == nil)
        return ZStack {
            if isRootView {
                content
                    .transition(viewModel.routerType == .push ? transitions.push : transitions.pop)
                    .environmentObject(viewModel)
            } else {
                viewModel.currentScreen!.nextScreen
                    .transition(viewModel.routerType == .push ? transitions.push : transitions.pop)
                    .environmentObject(viewModel)
            }
        }
    }
}
