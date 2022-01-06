//
//  SportScreen.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import SwiftUI

struct SportScreen: View {
    
    @ObservedObject var sportStore: SportStore
    
    var body: some View {
        VStack {
            Text("Sport Screen")
                .font(.largeTitle)
            
            Spacer(minLength: 40)
            content
            Spacer(minLength: 40)
            // Routing
            Button {
                sportStore.dispatch(.forward(AnyView(screenFactory.makeDateScreen())))
            } label: {
                Text("Go to Date screen")
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch sportStore.state {
            case .start:
                VStack {
                    Text("Starting view")
                    Button {
                        sportStore.dispatch(.getSportList)
                    } label: {
                        Text("Get Sport List")
                    }
                }
            case .currentDate(let date):
                Text("\(date)")
            case .data(let sportList):
                VStack {
                    ForEach(sportList, id: \.self) { sport in
                        Text(sport)
                    }
                    Spacer()
                    Button {
                        sportStore.dispatch(.getCurrendDate)
                    } label: {
                        Text("Get Current Date")
                    }
                    Spacer()
                }
        }
    }
}

struct SportScreen_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.makeSportScreen()
    }
}
