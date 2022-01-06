//
//  UDFRCApp.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import SwiftUI

@main
struct UDFRCApp: App {
    var body: some Scene {
        WindowGroup {
            Router {
                screenFactory.makeSportScreen()
            }
            .environmentObject(RouterFactory.shared.routerViewModel)
        }
    }
}
