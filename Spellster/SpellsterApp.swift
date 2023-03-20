//
//  Lion_SpellApp.swift
//  Lion Spell
//
//  Created by Zach Krevis on 8/25/22.
//

import SwiftUI

@main
struct SpellsterApp: App {
    @StateObject var spellsterManager = SpellsterManager()
    var body: some Scene {
        WindowGroup {
            SpellsterView()
                .environmentObject(spellsterManager)
        }
    }
}
