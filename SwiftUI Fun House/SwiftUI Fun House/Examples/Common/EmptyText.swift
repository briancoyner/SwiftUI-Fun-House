//
//  Created by Brian Coyner on 9/21/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

/// A view that always displays a hidden `Text` view using the current environment's `Font`.
///
/// This may be a complete hack, but sometimes a layout is easier to accomplish with a hidden
/// `Text` view.
///
struct EmptyText: View {

    @Environment(\.font) private var font

    var body: some View {
        Text(" ")
            .font(font)
            .hidden()
    }
}
