//
//  Created by Brian Coyner on 7/11/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI
import WidgetKit

/// Custom `Button` style that represents a "record" button.
///
/// The button style draws the following:
/// - outer ring
/// - inner view that adapts to changes to `RecordActionView.State`
///   - `.idle`: large "red" circle
///   - `.waiting`: small "red circle
///   - `.recordingArmed`: "red" rounded rectangle (think "stop" button)
///   - `.recording`: "red" rounded rectangle (think "stop" button)
///
/// - SeeAlso: `RecordActionView` for an example of how to use this style.

struct RecordActionButtonStyle: ButtonStyle {

    let state: RecordActionView.State

    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { proxy in
            ZStack {
                Circle()
                    .stroke(Color.white, lineWidth: proxy.size.width * 0.075)

                RoundedRectangle(cornerRadius: state.cornerRadius(forWidth: proxy.size.width))
                    .inset(by: state.insets(forWidth: proxy.size.width))
                    .scale(state.scale(forWidth: proxy.size.width))
                    .fill(configuration.isPressed ? Color.red.opacity(0.9): Color.red)
            }
        }
        .aspectRatio(contentMode: .fill)
    }
}

extension RecordActionView.State {

    fileprivate func cornerRadius(forWidth width: CGFloat) -> CGFloat {
        switch self {
        case .idle:
            return width / 2
        case .waiting:
            return width / 2
        case .recordingArmed, .recording:
            return width / 8
        }
    }

    fileprivate func scale(forWidth width: CGFloat) -> CGFloat {
        switch self {
        case .idle:
            return 1
        case .waiting:
            return 0.15
        case .recordingArmed, .recording:
            return 0.4
        }
    }

    fileprivate func insets(forWidth width: CGFloat) -> CGFloat {
        switch self {
        case .idle:
            return width * 0.075 * 1.2
        case .waiting:
            return 0
        case .recordingArmed, .recording:
            return 0
        }
    }
}
