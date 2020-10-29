//
//  Created by Brian Coyner on 7/11/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI
import WidgetKit


struct RecordActionButtonStyle: ButtonStyle {

    enum State: CaseIterable, CustomStringConvertible {
        var description: String {
            switch self {
            case .idle:
                return "Idle"
            case .waiting:
                return "Waiting"
            case .recording:
                return "Recording"
            }
        }

        case idle
        case waiting
        case recording
    }

    @Binding var state: State

    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { proxy in
            ZStack {
                Circle()
                    .stroke(Color.white, lineWidth: proxy.size.width * 0.075)

                RoundedRectangle(cornerRadius: state.cornerRadius(forWidth: proxy.size.width))
                    .inset(by: state.insets(forWidth: proxy.size.width))
                    .scale(state.scale(forWidth: proxy.size.width))
                    .fill(configuration.isPressed ? Color.red.opacity(0.8): Color.red)
                    .scaleEffect(configuration.isPressed ? 0.90 : 1.0)
            }
        }
        .aspectRatio(contentMode: .fill)
    }
}

extension RecordActionButtonStyle.State {

    fileprivate func cornerRadius(forWidth width: CGFloat) -> CGFloat {
        switch self {
        case .idle:
            return width / 2
        case .waiting:
            return width / 2
        case .recording:
            return width / 8
        }
    }

    fileprivate func scale(forWidth width: CGFloat) -> CGFloat {
        switch self {
        case .idle:
            return 1
        case .waiting:
            return 0.15
        case .recording:
            return 0.4
        }
    }

    fileprivate func insets(forWidth width: CGFloat) -> CGFloat {
        switch self {
        case .idle:
            return width * 0.075 * 1.2
        case .waiting:
            return 0
        case .recording:
            return 0
        }
    }
}
