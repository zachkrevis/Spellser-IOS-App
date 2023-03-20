//
//  Preferences.swift
//  Lion Spell
//
//  Created by Zach Krevis on 9/13/22.
//

import Foundation

enum Language : String, Identifiable, CaseIterable {
    case english, french
    var id: RawValue {rawValue}
}

enum KeyNumber : Int, Identifiable, CaseIterable {
    case five = 5, six = 6, seven = 7
    var id: RawValue {rawValue}
}

struct Preferences {
    var language : Language = .english
    var keyNumber : KeyNumber = .five
}
