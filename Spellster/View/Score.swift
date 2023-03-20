//
//  Score.swift
//  Lion Spell
//
//  Created by Zach Krevis on 8/28/22.
//

import SwiftUI

struct Score: View {
    @EnvironmentObject var spellsterManager : SpellsterManager
    let score :Int
    var body: some View {
        Text("Score: \(score)").fontWeight(.bold).font(.largeTitle).padding()
    }
}

struct Score_Previews: PreviewProvider {
    static var previews: some View {
        Score(score:10)
    }
}
