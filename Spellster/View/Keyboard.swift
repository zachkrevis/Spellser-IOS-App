//
//  Keyboard.swift
//  Lion Spell
//
//  Created by Zach Krevis on 8/28/22.
//

import SwiftUI

struct Keyboard: View {
    
    let charArray: Array<Character>
    
    var body: some View {
        VStack(spacing: -UIScreen.main.bounds.height/64) {
            HStack(spacing: -UIScreen.main.bounds.height/84) {
                ForEach(0..<2, id:\.self) {i in
                    Keyboard_Button(buttonLabel: "\(charArray[i])", color: Color.white, buttonAngle: 90, buttonSide: 6)
                }
            }
            
            HStack(spacing: -UIScreen.main.bounds.height/84) {
                ForEach(2..<5, id:\.self) {i in
                    Keyboard_Button(buttonLabel: "\(charArray[i])", color: Color.white, buttonAngle: 90, buttonSide: 6)
                }
            }
            
            HStack(spacing: -UIScreen.main.bounds.height/84) {
                ForEach(5...6, id:\.self) {i in
                    Keyboard_Button(buttonLabel: "\(charArray[i])", color: Color.white, buttonAngle: 90, buttonSide: 6)
                }
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(charArray: ["A", "B", "C", "D", "E", "F", "G"])
    }
}
