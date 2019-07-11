//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

struct LissajousDemoView: View {
    
    @State private var amplitude: Double = 100
    @State private var delta: Double = 0
    @State private var a: Double = 1
    @State private var b: Double = 2
    
    var body: some View {
        VStack {
            HStack {
                Text("Amplitude")
                Slider(value: $amplitude.animation(), from: 44, through: 180, by: 1)
            }
            HStack {
                Text("Delta")
                Slider(value: $delta.animation(), from: 0, through: 10, by: 0.01)
            }
            Stepper(value: $a.animation(), in: 0...10, step: 1) {
                Text(verbatim: "A (\(format: a, using: .decimal))")
            }
            Stepper(value: $b.animation(), in: 0...10, step: 1) {
                Text(verbatim: "B (\(format: b, using: .decimal))")
            }
            LissajousView(amplitude: amplitude, a: a, b: b, delta: delta)
        }.padding()
    }
}

#if DEBUG
struct LissajousDemoView_Previews : PreviewProvider {
    static var previews: some View {
        LissajousDemoView()
    }
}
#endif
