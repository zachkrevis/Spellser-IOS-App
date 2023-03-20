//
//  DiamondShape.swift
//  Lion Spell
//
//  Created by Zach Krevis on 9/12/22.
//

import SwiftUI
import Foundation

struct PolygonShape: Shape {
    let cornerRadius : CGFloat
    
    let sides:Int
    let angle:Int
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var pathArray : Array<CGPoint> = []
        let center:CGPoint = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius:Double = Double(rect.width / 2)
        for i in stride(from: angle, to: (360 + angle), by: 360/sides) {
            let radians = Double(i) * Double.pi / 180.0
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
            
            if (pathArray.count <= sides) {
                pathArray.append(CGPoint(x: x, y: y))
            }
        }
        
        path.move(to: pathArray[sides-1])
        
        for i in 0...sides-2 {
            path.addArc(tangent1End: pathArray[i], tangent2End: pathArray[i+1], radius: cornerRadius)
        }
        
        path.addArc(tangent1End: pathArray[sides-1], tangent2End: pathArray[0], radius: cornerRadius)
        
        path.closeSubpath()
        return path
    }
}
