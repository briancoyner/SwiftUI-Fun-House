//
//  RingShape.swift
//  SwiftUI Fun House
//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct RingShape: Shape {
    
    let endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: min(rect.width, rect.height) * 0.5,
            startAngle: .degrees(0),
            endAngle: endAngle,
            clockwise: false
        )
        
        return path
    }
}
