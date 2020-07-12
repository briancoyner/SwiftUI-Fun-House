//
//  Created by Brian Coyner on 9/20/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

struct RecordStatusView: View {

    var state: RecordActionView.State

    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .frame(width: 38, height: 38)
                .foregroundColor(Color.green.opacity(1.0))
            
            Circle()
                .frame(width: 38, height: 38)
                .foregroundColor(Color.yellow.opacity(0.4))

            Circle()
                .frame(width: 38, height: 38)
                .foregroundColor(Color.red.opacity(0.4))
        }
        .opacity(self.opacity(for: state))
    }

    private func opacity(for state: RecordActionView.State) -> Double {
        if case .recording = state {
            return 1.0
        } else {
            return 0.0
        }
    }
}
