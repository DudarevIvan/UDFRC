//
//  RouterViewModel.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import SwiftUI

final class RouterViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?
    
    private var stack: Stack = .init() {
        didSet {
            self.currentScreen = stack.topScreen()
        }
    }
    
    var routerType: RouterType = .push
    
    private let animation: Animation
    
    init(with animation: Animation) {
        self.animation = animation
    }
    
    func push<S: View>(_ screenView: S) {
        routerType = .push
        withAnimation(animation) {
            let screen: Screen = .init(nextScreen: AnyView(screenView))
            stack.push(screen)
        }
    }
    
    func pop() {
        routerType = .pop
        withAnimation(animation) {
            stack.pop()
        }
    }
    
    func popToRoot() {
        routerType = .popToRoot
        withAnimation(animation) {
            stack.popToRoot()
        }
    }
}
