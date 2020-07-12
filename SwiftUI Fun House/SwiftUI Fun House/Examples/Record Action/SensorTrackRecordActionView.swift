//
//  Created by Brian Coyner on 9/21/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

struct SensorTrackRecordActionView: View {

    @Binding
    var state: RecordActionView.State

    var body: some View {
        VStack {
            RecordActionSummaryView(state: state)
                .padding()

            RecordActionView(state: $state)
                .frame(width: 88, height: 88)

            RecordStatusView(state: state)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(
            GeometryReader { proxy in
                RadialGradient(
                    gradient: Gradient(
                        colors: [Color.blue, Color.black]
                    ),
                    center: .center,
                    startRadius: 0,
                    endRadius: proxy.size.width * 2
                )
            }
        )
    }
}
