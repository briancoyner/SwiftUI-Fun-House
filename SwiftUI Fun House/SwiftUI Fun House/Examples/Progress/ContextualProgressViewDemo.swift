//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Combine
import SwiftUI

struct ContextualProgressViewDemo : View {
    
    @ObservedObject private var properties = ProgressDemoProperties()
    
    var body: some View {
        VStack {
            VStack(spacing: 44) {
                ProgressView(color: properties.selectedColor, progress: properties.progress) {
                    ZStack {
                        Circle()
                            .inset(by: 8)
                            .stroke(properties.selectedColor, lineWidth: 2)
                        ProgressStop()
                    }
                }
                Divider()
                ProgressView(color: properties.selectedColor, progress: properties.progress) {
                    ZStack {
                        Circle()
                            .inset(by: 8)
                            .stroke(properties.selectedColor, lineWidth: 2)
                        ProgressText(progress: properties.progress)
                    }
                }
            }
            Divider().padding([.top, .bottom])
            ProgressDemoPropertiesView(properties: properties)
        }.padding()
    }
}
