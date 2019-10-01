//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

/// This is not actually needed because `SwiftUI.Circle` plus the `trim` modifier
/// already handles everything needed to build a "circular progress" shape.
///
/// This example shows how to implement `animatableData` for a single primitive value.

struct AnimatableProgressShape: Shape {
    
    var progress: CGFloat
    
    var animatableData: CGFloat {
        get { return progress }
        set { progress = newValue }
    }
}

extension AnimatableProgressShape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let endAngle = progress * 360
        path.addArc(
            center: center,
            radius: min(rect.width, rect.height) * 0.5,
            startAngle: .degrees(0),
            endAngle: .degrees(Double(endAngle)),
            clockwise: false
        )
        
        return path
    }
}
