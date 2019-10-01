//
//  Created by Brian Coyner on 7/14/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct ProgressStop : View {
    var body: some View {
        GeometryReader { context in
            RoundedRectangle(cornerRadius: context.size.width / 8, style: .continuous)
                .aspectRatio(1, contentMode: .fit)
                .scaleEffect(0.25)
        }
    }
}
