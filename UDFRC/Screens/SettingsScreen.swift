//
//  SettingsScreen.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import SwiftUI

struct SettingsScreen: View {
    
    @ObservedObject var settingsStore: SettingsStore
    
    var body: some View {
        VStack {
            Text("Settings Screen")
                .font(.largeTitle)
            Spacer(minLength: 40)
            content
            Spacer(minLength: 40)
            // Routing
            Button {
                settingsStore.dispatch(.back)
            } label: {
                Text("Go to back")
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch settingsStore.state {
            case .loading:
                VStack {
                    Text("Loading...")
                    Button {
                        settingsStore.dispatch(.getUserSettings)
                    } label: {
                        Text("Get User Settings")
                    }
                }
            case .data(let dateOfSportingEvent):
                VStack {
                    let keys = Array<String>(dateOfSportingEvent.keys)
                    ForEach(keys, id: \.self) { key in
                        HStack {
                            Text(key)
                            Spacer()
                            Text("\(dateOfSportingEvent[key]!)")
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeSettingsScreen()
    }
}
