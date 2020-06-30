//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Combine
import SwiftUI

struct SimpleProgressViewDemo : View {
    
    @StateObject private var properties = ProgressDemoProperties()
    
    var body: some View {
        VStack {
            ProgressView(color: properties.selectedColor, progress: properties.progress) {
                EmptyView()
            }
            .padding()

            Divider()

            ProgressDemoPropertiesView(properties: properties)
        }
        .padding()
    }
}
