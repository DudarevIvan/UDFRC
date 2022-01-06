//
//  DateScreen.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import SwiftUI

struct DateScreen: View {
    
    @ObservedObject var dateStore: DateStore
    
    var body: some View {
        VStack {
            Text("Date Screen")
                .font(.largeTitle)
            Spacer(minLength: 40)
            content
            Spacer(minLength: 40)
            // Routing
            Button {
                dateStore.dispatch(.forward(AnyView(screenFactory.makeSettingsScreen())))
            } label: {
                Text("Go to Settings Screen")
            }
            Button {
                dateStore.dispatch(.back)
            } label: {
                Text("Go to back")
            }
            Button {
                dateStore.dispatch(.home)
            } label: {
                Text("Go to Home Screen")
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch dateStore.state {
            case .loading:
                VStack {
                    Text("Loading...")
                    Button {
                        dateStore.dispatch(.getResult)
                    } label: {
                        Text("Get Date of Sporting List")
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

struct ResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeDateScreen()
    }
}
