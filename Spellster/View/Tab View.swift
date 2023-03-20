//
//  Tab View.swift
//  Lion Spell
//
//  Created by Zach Krevis on 8/29/22.
//

import SwiftUI

struct Tab_View: View {
    let currentString : String
    let answerArray :Array<String>
    @EnvironmentObject var spellsterManager : SpellsterManager
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                VStack {
                    String_View(string: currentString, correct: false)
                        .frame(width: UIScreen.main.bounds.width)
                    if (answerArray.count > 0) {
                        HStack {
                            Text("SWIPE").fontWeight(.bold).foregroundColor(Color.white).font(.largeTitle)
                        Image(systemName: "chevron.forward")
                        }.font(Font.system(size: 24, weight: .bold))
                    }
                    
                }
                ForEach (0..<answerArray.count, id: \.self) { index in
                    String_View(string: answerArray[index], correct: true)
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
        }
    }
}

struct Tab_View_Previews: PreviewProvider {
    static var previews: some View {
        Tab_View(currentString: "SPACE", answerArray:  ["SPACER", "ABCDE"])
    }
}
