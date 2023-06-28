//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Combine
import SwiftUI

struct SimpleCircleProgressDemoView: View {
    
    @Bindable private var properties = ProgressDemoProperties()

    var body: some View {
        VStack(spacing: 44) {
            // A stroked circle looks pretty good
            Circle()
                .trim(from: 0, to: properties.progress)
                .stroke(properties.selectedColor, lineWidth: 8)
            
            // A filled circle... not really what we are going for
            // The problem is that Circle doesn't draw the path from
            // the center point. Therefore we get a "filled" circle
            // not a "Pac-Man" circle.
            //
            // See the `PieSlice` for how we can draw a "Pac-Man" path.
            Circle()
                .trim(from: 0, to: properties.progress)
                .fill(properties.selectedColor)
            
            // Shows how to create a custom shape with `animatableData`
            // This is not actually needed because we can `Circle`
            // along with the `trim` value.
            //
            // See the `Lissajous` example for an additional example
            // of using `animatableData`.
            AnimatableProgressShape(progress: properties.progress)
                .stroke(properties.selectedColor, lineWidth: 8)

            Divider()

            ProgressDemoPropertiesView(properties: properties)
        }.padding()
    }
}
