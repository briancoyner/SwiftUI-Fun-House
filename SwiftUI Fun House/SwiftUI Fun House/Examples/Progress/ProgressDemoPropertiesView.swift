//
//  Created by Brian Coyner on 7/13/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Combine
import SwiftUI

struct ProgressDemoPropertiesView : View {
    
    @Bindable var properties: ProgressDemoProperties

    var body: some View {
        Section {
            Picker(selection: $properties.selectedColor.animation(), label: EmptyView()) {
                ForEach([Color.blue, .green, .gray, .red], id: \.self) {
                    Text(String(describing: $0.self).capitalized)
                }
            }.pickerStyle(SegmentedPickerStyle())

            Slider(value: $properties.progress, in: 0.0...1.0, step: 0.01)
            Stepper("Progress", value: $properties.progress.animation(), in: 0.0...1.0, step: 0.25)
        }
    }
}
