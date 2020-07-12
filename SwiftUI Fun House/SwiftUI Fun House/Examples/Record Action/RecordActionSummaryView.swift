//
//  Created by Brian Coyner on 9/19/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

struct RecordActionSummaryView: View {

    let state: RecordActionView.State

    var body: some View {
        switch state {
        case .idle:
            InternalRecordActionSummaryView(
                title: EmptyText(),
                subtitle: EmptyText()
            )
        case .waiting:
            InternalRecordActionSummaryView(
                title: Text("sensor-track-status.recording-armed.text"),
                subtitle: Text("sensor-track-status-hint.recording-armed-waiting.text")
            )
        case .recordingArmed:
            InternalRecordActionSummaryView(
                title: Text("sensor-track-status.recording-armed.text"),
                subtitle: Text("sensor-track-status-hint.recording-armed.text")
            )
        case .recording:
            InternalRecordActionSummaryView(
                title: Text("sensor-track-status.recording.text"),
                subtitle: ElapsedTimeView(referenceDate: Date())
            )
        }
    }
}

private struct InternalRecordActionSummaryView<Title, Subtitle>: View where Title: View, Subtitle: View {

    let title: Title
    let subtitle: Subtitle

    var body: some View {
        VStack {
            title
                .font(.title)

            subtitle
                .font(.headline)
        }
        .foregroundColor(.white)
    }
}
