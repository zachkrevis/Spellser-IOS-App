//
//  Rounded Corners.swift
//  Lion Spell
//
//  Created by Zach Krevis on 8/28/22.
//

import SwiftUI

struct roundedCorners: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii:CGSize(width:radius, height: radius))
        return Path(path.cgPath)
    }
}
