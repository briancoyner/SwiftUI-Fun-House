//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

/// A demo showing how to create an animatable Lissajous curve using SwiftUI.
/// This is based on my Core Animation Fun House example code.

struct LissajousDemoView: View {
    
    @State private var amplitude: Double = 100
    @State private var delta: Double = 0
    @State private var a: Double = 1
    @State private var b: Double = 2
    
    var body: some View {
        Form {
                Section {
                    LissajousView(amplitude: amplitude, a: a, b: b, delta: delta)
                        .frame(idealHeight: 200)
                }
//                    .padding([.top, .bottom])

                Section(header: Text("Amplitude")) {
                    Slider(value: $amplitude.animation(), in: 22...84, step: 1)
                }

                Section(header: Text("Delta")) {
                    Slider(value: $delta.animation(), in: 0...10, step: 0.01)
                }

                Section {
                    Stepper(value: $a.animation(), in: 0...10, step: 1.0) {
                        Text(verbatim: "A \(a.formatted())")
                    }

                    Stepper(value: $b.animation(), in: 0...10, step: 1.0) {
                        Text(verbatim: "B \(b.formatted())")
                    }
                }
            }
        
        .navigationTitle("Lissajous")

//        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        LissajousDemoView()
    }
}
