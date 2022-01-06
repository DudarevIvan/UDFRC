//
//  State.swift
//  UDFRC
//
//  Created by Ivan Dudarev on 06.01.2022.
//

import Foundation

// Sport State
enum SportState {
    case start
    case currentDate(Date)
    case data(Array<String>)
}

// Date State
enum DateState {
    case loading
    case data(Dictionary<String, String>)
}

// Settings State
enum SettingsState {
    case loading
    case data(Dictionary<String, String>)
}
