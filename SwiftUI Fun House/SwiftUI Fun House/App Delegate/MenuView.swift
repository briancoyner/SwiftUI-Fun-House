//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct MenuView : View {
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Animatable Data")) {
                    NavigationLink("Sine Wave", destination: SineWaveDemoView())
                    NavigationLink("Lissajous", destination: LissajousDemoView())
                }
                Section(header: Text("Math")) {
                    NavigationLink("Three Point Circle", destination: ThreePointCircleDemo())
                }
                Section(header: Text("Circular Progress Views")) {
                    NavigationLink("Simple `Circle`", destination: SimpleCircleProgressDemoView())
                    NavigationLink("Simple `PieSlice`", destination: SimplePieSliceProgressDemoView())
                    NavigationLink("Contextual `ProgressView`", destination: ProminentProgressViewDemo())
                    NavigationLink("Indeterminate Progress", destination: IndeterminateProgressDemoView())
                }
                Section(header: Text("Recreating High Rail App Views In SwiftUI")) {
                    NavigationLink("SensorTrack™ Recording", destination: RecordActionDemoView())
                }
                Section(header: Text("Adaptive Rounded Rectangle")) {
                    NavigationLink("Adaptive Rounded Rectangle", destination: AdaptiveRoundedRectangleDemo())
                }
                Section(header: Text("Forms")) {
                    NavigationLink("Simple Customer Form", destination: CustomerForm())
                }
            }
            .navigationTitle("SwiftUI Fun House")
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
