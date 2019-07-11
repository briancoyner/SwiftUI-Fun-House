//
//  RotatingRingView.swift
//  SwiftUI Fun House
//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct RotatingRingView: View {
    
    let lineWidth: Double = 15
    
    @State
    private var rotation: Angle = .degrees(-90)
    
    private let animation = Animation
        .basic(duration: 1.5, curve: .linear)
        .repeatForever(autoreverses: false)
    
    var body: some View {
        return RingShape(endAngle: .degrees(320))
            .stroke(Color.blue, lineWidth: Length(lineWidth))
            .rotationEffect(rotation)
            .animation(animation, value: rotation)
            .onAppear {
                self.rotation = .degrees(360 - 90)
            }
    }
}

#if DEBUG
struct RotatingRingView_Previews : PreviewProvider {
    static var previews: some View {
        RotatingRingView()
    }
}
#endif
