//
//  Created by Brian Coyner on 7/14/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct ProgressText : View {
    
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { [progress] context in
            Text(verbatim: "\(format: progress, using: .percent)")
                .frame(alignment: .center)
                .font(.system(size: context.size.width * 0.15))
        }
    }
}