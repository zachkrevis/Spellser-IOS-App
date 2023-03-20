//
//  String View.swift
//  Lion Spell
//
//  Created by Zach Krevis on 8/29/22.
//

import SwiftUI

struct String_View: View {
    @EnvironmentObject var spellsterManager : SpellsterManager
    let string: String
    let correct :Bool
    var body: some View {
        VStack{
            HStack(alignment: .bottom) {
                Text(string).fontWeight(.bold).foregroundColor(correct ? Color.white : Color.black)
                    .font(.largeTitle)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: 64)
            .background(correct ? Color.green : Color.white)
            .cornerRadius(16)
            
            
            correct ? Text("Correct!").fontWeight(.bold).foregroundColor(Color.white).font(.largeTitle) : nil
        }.padding()
    }
}

struct String_View_Previews: PreviewProvider {
    static var previews: some View {
        String_View(string: "", correct: false)
    }
}
