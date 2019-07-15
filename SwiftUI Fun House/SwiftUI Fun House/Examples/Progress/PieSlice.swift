//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

/// This is similar to a `SwiftUI.Circle` except that the path is always
/// drawn from the center of the rect. This allows for creating "pie" slices (or pac-man).
struct PieSlice: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Moving the start point is what creates the "pie" slice.
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: (min(rect.width, rect.height)) * 0.5,
            startAngle: .degrees(0),
            endAngle: .degrees(360),
            clockwise: false
        )
        
        return path
    }
}

#if DEBUG
struct RingShape_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            PieSlice()
                .padding()
            PieSlice()
                .padding(45)
        }
    }
}
#endif
