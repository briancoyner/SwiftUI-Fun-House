//
//  Created by Brian Coyner on 7/16/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

struct IndeterminateProgressDemoView: View {
    
    @Bindable private var properties = ProgressDemoProperties()
    
    var body: some View {
        VStack {
            IndeterminateProgressRingView(color: properties.selectedColor, trimTo: properties.progress)
            Divider()
            ProgressDemoPropertiesView(properties: properties)
        }.padding()
    }
}
