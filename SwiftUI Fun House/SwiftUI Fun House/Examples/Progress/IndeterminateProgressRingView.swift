//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct IndeterminateProgressRingView: View {
    
    var color: Color
    var trimTo: CGFloat
    
    @State private var rotation: Angle = .degrees(-90)

    private let animation = Animation
        .linear
        .repeatForever(autoreverses: false)
        .speed(0.15)
    
    var body: some View {
        return Circle()
            .trim(from: 0, to: trimTo)
            .stroke(color, lineWidth: 4)
            .rotationEffect(rotation)
            .animation(animation, value: rotation)
            .onAppear {
                self.rotation = .degrees(360 - 90)
            }
    }
}
