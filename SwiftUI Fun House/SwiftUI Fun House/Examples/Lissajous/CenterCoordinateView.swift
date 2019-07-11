//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

struct CoordinateView: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX - rect.width * 0.10, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width, y: rect.midY))
        
        path.move(to: CGPoint(x: rect.midX, y: rect.midY - rect.height * 0.10))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.height))
        
        return path
    }
}
