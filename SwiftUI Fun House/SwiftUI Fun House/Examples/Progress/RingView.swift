//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    var lineWidth: Double
    
    var body: some View {
        return RingShape(endAngle: .degrees(360))
            .stroke(Color.gray, lineWidth: Length(lineWidth))
    }
}

#if DEBUG
struct RingView_Previews : PreviewProvider {
    static var previews: some View {
        RingView(lineWidth: 4)
    }
}
#endif
