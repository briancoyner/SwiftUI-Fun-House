//
//  Created by Brian Coyner on 7/17/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

struct SineWave: Shape, Equatable {
    
    var amplitude: CGFloat
    var frequency: CGFloat
    var phase: CGFloat

    var animatableData: AnimatablePair<AnimatablePair<CGFloat, CGFloat>, CGFloat> {
        get {
            .init(.init(amplitude, frequency), phase)
        }
        set {
            amplitude = newValue.first.first
            frequency = newValue.first.second
            phase = newValue.second
        }
    }
}

extension SineWave {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let stepCount = rect.width
        for t in stride(from: 0, to: stepCount, by: 1) {
            let y = amplitude * sin(t * frequency + phase)
            if path.isEmpty {
                path.move(to: CGPoint(x: 0, y: y))
            } else {
                path.addLine(to: CGPoint(x: t, y: y))
            }
        }
        
        return path.applying(CGAffineTransform(
            translationX: 0,
            y: rect.height / 2.0
        ))
    }
}
