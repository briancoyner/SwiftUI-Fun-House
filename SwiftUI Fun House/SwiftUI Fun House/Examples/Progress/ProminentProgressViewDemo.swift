//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Combine
import SwiftUI

/// A demo showing the custom `ProminentProgressViewStyle` attached to a `ProgressView`
struct ProminentProgressViewDemo : View {
    
    @ObservedObject private var properties = ProgressDemoProperties()
    
    var body: some View {
        VStack {
            ProgressView("Prominent Style", value: properties.progress)
                .progressViewStyle(ProminentProgressViewStyle())
                .padding(88)

            Divider().padding([.top, .bottom])

            ProgressDemoPropertiesView(properties: properties)
        }
        .accentColor(properties.selectedColor)
        .padding()
    }
}

#if DEBUG
struct ProminentProgressViewDemo_Previews : PreviewProvider {
    static var previews: some View {
        ProminentProgressViewDemo()
    }
}
#endif
