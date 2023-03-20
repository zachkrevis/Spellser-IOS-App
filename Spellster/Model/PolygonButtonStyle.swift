//
//  DiamondButtonStyle.swift
//  Lion Spell
//
//  Created by Zach Krevis on 9/12/22.
//

import SwiftUI

struct PolygonButtonStyle: ButtonStyle {
    let background : Color;
    let sides : Int
    let cornerRadius : CGFloat
    let angle : Int
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(.system(size: 28, weight:.bold, design: .rounded))
            .foregroundColor(.white)
            .background(
                PolygonShape(cornerRadius: self.cornerRadius, sides: self.sides, angle: self.angle)
                    .fill(background).frame(width: UIScreen.main.bounds.height/9, height: UIScreen.main.bounds.height/9).padding())
            .shadow(color:.black, radius: 0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
       }
}

struct PolygonButtonStyle_Preview: PreviewProvider {
    static var previews: some View {
        Keyboard_Button(buttonLabel: "A", color: Color.gray, buttonAngle: 0, buttonSide: 4)
    }
}
