//
//  Created by Brian Coyner on 7/17/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

/// A demo showing how to create an animatable Sine Wave using SwiftUI.
/// This is based on my Core Animation Fun House example code.
///
/// The `SineWave`  shape uses the following equation to draw the sine wave:
/// y = A * sin(ωt + phase), where A = amplitude,  ω = angular frequency

struct SineWaveDemoView: View {
   
    @State private var amplitude: CGFloat = 44
    @State private var frequency: CGFloat = 0.1
    @State private var phase: CGFloat = 1
    
    var body: some View {
        Form {
            Section {
                SineWaveView(amplitude: amplitude, frequency: frequency, phase: phase)
                    .frame(idealHeight: 180)
                    .padding([.top, .bottom])
            }

            Section(header: Text("Amplitude")) {
                Slider(value: $amplitude.animation(), in: 0...160)
            }

            Section(header: Text("Frequency")) {
                Slider(value: $frequency.animation(), in: 0.0...0.16)
            }

            Section(header: Text("Phase")) {
                Slider(value: $phase.animation(), in: -.pi...CGFloat.pi)
            }
        }
    }
}
