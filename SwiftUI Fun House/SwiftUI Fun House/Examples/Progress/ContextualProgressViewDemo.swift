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
                Text("Hello")
                ProgressView(color: properties.selectedColor, progress: properties.progress) {
                    Circle()
                        .inset(by: 8)
                        .stroke(properties.selectedColor, lineWidth: 2)
                        .overlay(ProgressStop())
                }

                Divider()

                ProgressView(color: properties.selectedColor, progress: properties.progress) {
                    Circle()
                        .inset(by: 8)
                        .stroke(properties.selectedColor, lineWidth: 2)
                        .overlay(ProgressText(progress: properties.progress))
                    
                }
            }

            Divider().padding([.top, .bottom])

            ProgressDemoPropertiesView(properties: properties)
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

#if DEBUG
struct ContextualProgressViewDemo_Previews : PreviewProvider {
    static var previews: some View {
        ContextualProgressViewDemo()
    }
}
#endif


