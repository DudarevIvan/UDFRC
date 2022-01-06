//
//  MockFile.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import Foundation

struct MockFile: Hashable {
    
    static let sportList: Array<String> = ["Football", "Hockey", "Basketball", "Tennis"]
    
    static let dateOfSportingEvent: Dictionary<String, String> = [
        "Football": "1/06/2022",
        "Hockey": "12/04/2022",
        "Basketball": "8/09/2022",
        "Tennis": "5/05/2022",
    ]
    
    static let userSettings: Dictionary<String, String> = [
        "user": "Jack",
        "password": "It's very complex password",
        "Other info": "Something",
    ]
}
