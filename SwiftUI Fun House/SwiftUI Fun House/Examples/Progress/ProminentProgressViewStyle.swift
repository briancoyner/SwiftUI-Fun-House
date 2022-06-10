//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

/// A custom `ProgressViewStyle` that displays a progress ring centered on top of a ring. The user
/// sees the current progress displayed as a percent in the center of the view.
///
/// This style is useful when displaying progress "full screen" (e.g. long running task while onboarding a user).
struct ProminentProgressViewStyle: ProgressViewStyle {

    func makeBody(configuration: Configuration) -> some View {
        let value = Double(configuration.fractionCompleted ?? 0)
        return GeometryReader { context in
            ZStack {
                Circle()
                    .stroke(Color.primary, lineWidth: 2)
                Circle()
                    .trim(from: 0, to: value)
                    .stroke(Color.accentColor, lineWidth: self.progressLineWidth(basedOn: context.size))
                    .rotationEffect(.degrees(-90))
            }
            .overlay(
                Text(verbatim: value.formatted(.percent))
                    .font(.system(size: max(context.size.width * 0.2, UIFont.smallSystemFontSize), design: .monospaced))
            )
        }
    }

    private func progressLineWidth(basedOn size: CGSize) -> CGFloat {
        return floor(max(radius(baseOn: size) * 0.1, 2.0))
    }

    private func radius(baseOn size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.5
    }
}
