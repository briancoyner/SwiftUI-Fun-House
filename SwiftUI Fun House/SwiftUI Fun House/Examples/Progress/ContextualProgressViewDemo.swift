//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Combine
import SwiftUI

struct ProminentProgressViewDemo : View {
    
    @ObservedObject private var properties = ProgressDemoProperties()
    
    var body: some View {
        VStack {
            VStack(spacing: 44) {

                ProgressView("Simple", value: properties.progress)

                ProgressView("Style 1", value: properties.progress)
                    .progressViewStyle(MyStyle())

                ProgressView("Style 2", value: properties.progress)
                    .progressViewStyle(MyStyle2())
            }
            .accentColor(properties.selectedColor)

            Divider().padding([.top, .bottom])

            ProgressDemoPropertiesView(properties: properties)
        }
        .padding()
    }
}

#if DEBUG
struct ContextualProgressViewDemo_Previews : PreviewProvider {
    static var previews: some View {
        ProminentProgressViewDemo()
    }
}
#endif


