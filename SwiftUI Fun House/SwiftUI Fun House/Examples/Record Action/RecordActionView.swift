//
//  Created by Brian Coyner on 9/19/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import AudioToolbox
import SwiftUI

struct RecordActionView: View {

    enum State: CaseIterable {
        case idle
        case waiting
        case recordingArmed
        case recording
    }

    /// User interaction state transitions:
    /// - `.idle` -> `.recordingArmed`
    /// - `.waiting` -> `.idle`
    /// - `.recordingArmed` -> `.idle`
    /// - `.recording` -> `.idle`
    @Binding var state: State

    var body: some View {
        Button("sensor-track-button.record.text") {
            withAnimation(.linear(duration: 0.1)) {
                switch state {
                case .idle:
                    self.state = .recordingArmed
                    SoundPlayer.play(.beginRecording)
                case .recordingArmed, .recording, .waiting:
                    self.state = .idle
                    SoundPlayer.play(.endRecording)
                }
            }
        }
        .contentShape(Circle())
        .buttonStyle(RecordActionButtonStyle(state: state))
    }
}
