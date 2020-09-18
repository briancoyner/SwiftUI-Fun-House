//
//  Created by Brian Coyner on 9/17/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

/// A custom `ProgressViewStyle` that displays a progress ring around an inner ring. For demo purposes,
/// the view displays a rounded rectangle represening a "stop button".
struct InteractiveProgressViewStyle: ProgressViewStyle {

    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { context in
            ZStack {
                Circle()
                    .stroke(Color.accentColor, lineWidth: 2)
                Circle()
                    .inset(by: -(self.progressLineWidth(basedOn: context.size) * 0.5))
                    .trim(from: 0, to: CGFloat(configuration.fractionCompleted ?? 0))
                    .stroke(Color.accentColor, lineWidth: self.progressLineWidth(basedOn: context.size))
                    .rotationEffect(.degrees(-90))

                RoundedRectangle(cornerRadius: context.size.width / 8, style: .continuous)
                    .foregroundColor(.accentColor)
                    .aspectRatio(1, contentMode: .fit)
                    .scaleEffect(0.3)
            }
        }
    }

    private func progressLineWidth(basedOn size: CGSize) -> CGFloat {
        return floor(max(radius(baseOn: size) * 0.25, 4.0))
    }

    private func radius(baseOn size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.5
    }
}
