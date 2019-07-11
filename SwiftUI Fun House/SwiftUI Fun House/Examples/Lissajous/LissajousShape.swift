//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

struct Lissajous: Shape, Equatable {
    
    var amplitude: Double
    var a: Double
    var b: Double
    var delta: Double
    
    var animatableData: AnimatablePair<AnimatablePair<Double, Double>, AnimatablePair<Double, Double>> {
        get {
            .init(.init(amplitude, delta), .init(a, b))
        }
        set {
            amplitude = newValue.first.first
            a = newValue.second.first
            b = newValue.second.second
            delta = newValue.first.second
        }
    }
}

extension Lissajous {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let incrementBy = (.pi * 2.0) / (a * b * 100)
        var shouldMovePoint = true
        
        let to = (.pi * 2.0) + incrementBy
        
        for t in stride(from: 0.0, to: to, by: incrementBy) {
            
            let x = (amplitude * sin(a * t + delta))
            let y = (amplitude * sin(b * t))
            
            if shouldMovePoint {
                path.move(to: CGPoint(x: x, y: y))
                shouldMovePoint = false
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
            .applying(CGAffineTransform(translationX: rect.width / 2.0, y: rect.height / 2.0))
    }
    
    
}
