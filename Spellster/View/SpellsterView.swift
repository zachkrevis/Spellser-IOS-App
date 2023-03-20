//
//  LionSpellView.swift
//  Lion Spell
//
//  Created by Zach Krevis on 9/5/22.
//

import SwiftUI


struct SpellsterView: View {
    @EnvironmentObject var spellsterManager : SpellsterManager
    @State private var showing : Bool = false
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0/255, green: 180/255, blue: 180/255, alpha: 1.0))
                .ignoresSafeArea()
            VStack {
                Score(score: spellsterManager.score).padding(.bottom, 32)
                Tab_View(currentString: spellsterManager.guessedWord, answerArray: spellsterManager.correctWords)
                Spacer()
                
                bottomCard(showing: $showing, CharArray: spellsterManager.keyboardLetters)
                
            }.padding(.top, 48).sheet(isPresented: $showing) { hintView(possibleWords: spellsterManager.possibleWords, possiblePoints: spellsterManager.possibleScore, possiblePangrams: spellsterManager.possiblePangrams)
            }
        }.preferredColorScheme(.dark)
        
    }
}


struct SpellsterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SpellsterView().environmentObject(SpellsterManager())
            SpellsterView()
                .previewDevice("iPhone 6s").environmentObject(SpellsterManager())
        }
    }
}
