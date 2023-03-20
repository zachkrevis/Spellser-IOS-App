//
//  Keyboard Button.swift
//  Lion Spell
//
//  Created by Zach Krevis on 8/28/22.
//

import SwiftUI

struct Keyboard_Button: View {
    @EnvironmentObject var spellsterManager : SpellsterManager
    let buttonLabel : String
    let color : Color
    let buttonAngle : Int
    let buttonSide : Int
    var body: some View {
        Button(action: {spellsterManager.keyboardType(typedChar: buttonLabel)}
        ) {
            Text(buttonLabel).fontWeight(.bold).foregroundColor(Color.black)
                .font(.largeTitle)
        }
        .buttonStyle(PolygonButtonStyle(background: self.color, sides: 4, cornerRadius:  UIScreen.main.bounds.height/64, angle: 45))
        .frame(width: UIScreen.main.bounds.height/9, height: UIScreen.main.bounds.height/9)
        
    }
}

struct Keyboard_Button_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard_Button(buttonLabel: "A", color: Color.white, buttonAngle: 0, buttonSide: 4)
    }
}
