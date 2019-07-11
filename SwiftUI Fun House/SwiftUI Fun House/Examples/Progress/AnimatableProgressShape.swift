//
//  AnimatableProgressShape.swift
//  SwiftUI Fun House
//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct ProgressShape: Shape {
    
    var progress: Double
    
    var animatableData: Double {
        get { return progress }
        set { progress = newValue }
    }
}

extension ProgressShape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let endAngle = progress * 360
        path.addArc(
            center: center,
            radius: min(rect.width, rect.height) * 0.5,
            startAngle: .degrees(0),
            endAngle: .degrees(endAngle),
            clockwise: false
        )
        
        return path
    }
}
