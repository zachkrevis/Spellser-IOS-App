//
//  bottomCard.swift
//  Lion Spell
//
//  Created by Zach Krevis on 8/28/22.
//

import SwiftUI

struct bottomCard: View {
    @EnvironmentObject var spellsterManager : SpellsterManager
    @Binding var showing : Bool
    let CharArray : Array<Character>
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                Keyboard(charArray: CharArray)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {spellsterManager.delChar()}, label: {
                        Image(systemName: "delete.left.fill")
                    })
                    .accentColor(Color.white)
                    .font(.system(size:40))
                    
                    Spacer()
                    Spacer()
                    
                    Button(action: {spellsterManager.checkString()}, label: {
                        Image(systemName: "checkmark")
                    })
                    .accentColor(Color.white)
                    .font(.system(size:38))
                    .disabled(!spellsterManager.enableSubmit)
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {showing = true}, label: {
                        Image(systemName: "lightbulb.fill")
                    })
                    .accentColor(Color.white)
                    .font(.system(size:40))
                    
                    Spacer()
                    
                    Button(action: {spellsterManager.newGame()}, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                    .accentColor(Color.white)
                    .font(.system(size:40))
                    Spacer()
                }
                
            }.padding([.bottom], 24)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
        .background(roundedCorners(corners: [.topLeft, .topRight], radius: 24)
            .fill(Color(UIColor(red: 0/255, green: 135/255, blue: 135/255, alpha: 1.0)))
            .ignoresSafeArea())
        
    }
}

struct bottomCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            bottomCard(showing: .constant(false), CharArray: ["P", "A", "S", "C", "E", "F", "G"]).environmentObject(SpellsterManager())
            bottomCard(showing: .constant(false), CharArray: ["P", "A", "S", "C", "E", "F", "G"]).previewDevice("iPhone 6s").environmentObject(SpellsterManager())
    
        }
    }
}
