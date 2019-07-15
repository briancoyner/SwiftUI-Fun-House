//
//  Created by Brian Coyner on 7/17/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

struct SineWaveView: View {
    
    var amplitude: CGFloat
    var frequency: CGFloat
    var phase: CGFloat
    
    var body: some View {
        ZStack {
            CoordinateView()
                .stroke(Color.red, lineWidth: 1)
            SineWave(amplitude: amplitude, frequency: frequency, phase: phase)
                .stroke(Color.blue, lineWidth: 2)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
