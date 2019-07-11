//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

struct LissajousView: View {
    
    var amplitude: Double
    var a: Double
    var b: Double
    var delta: Double
    
    var body: some View {
        ZStack {
            CoordinateView()
                .stroke(Color.gray, lineWidth: Length(1))
            Lissajous(amplitude: amplitude, a: a, b: b, delta: delta)
                .stroke(Color.blue, lineWidth: Length(4))
        }
        .border(Color.primary, width: 2, cornerRadius: Length(8))
        .aspectRatio(1, contentMode: .fit)
    }
}
