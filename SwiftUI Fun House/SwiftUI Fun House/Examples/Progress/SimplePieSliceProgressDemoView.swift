//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Combine
import SwiftUI

struct SimplePieSliceProgressDemoView : View {
    
    @ObservedObject private var properties = ProgressDemoProperties()
    
    var body: some View {
        VStack(spacing: 44) {
            PieSlice()
                .trim(from: 0, to: properties.progress)
                .stroke(properties.selectedColor, lineWidth: 8)
            
            PieSlice()
                .trim(from: 0, to: properties.progress)
                .fill(properties.selectedColor)

            Divider()
            
            ProgressDemoPropertiesView(properties: properties)
        }.padding()
    }
}
