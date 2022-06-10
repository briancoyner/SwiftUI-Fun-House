//
//  Created by Brian Coyner on 7/11/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

/// This demo shows how I recreated my High Rail app's SensorTrack recording view in SwiftUI.
///
/// Useful High Rail app links:
/// - https://highrailcompany.com/high-rail-app/
/// - https://apps.apple.com/app/apple-store/id842021291
///
/// This demo shows a few different techniques:
/// - Custom `ButtonStyle` that:
///   - draws a "record" button.
///   - smoothly animates the "record" button between the SensorTrack recording states (idle, waiting, recording armed, and recording).
///   - See `RecordActionButtonStyle`
///
/// - Elapsed time view showing how to use a `Timer` to publish events every second using Combine.
///   - Shows a technique for cancelling a `Publishers.Autoconnect` when a view disappears.
///   - See `ElapsedTimeView`
///
/// - Playing sounds when the user interacts with the "record" button.
///   - see `RecordActionView`
///
/// - Using a `GeometryReader` and `RadialGradient` to make a nice looking background.
///   - See `SensorTrackRecordActionView`
///
/// - Picker (segmented control) to simulate non-user interactive SensorTrack recording state changes (non-animating).
struct RecordActionDemoView: View {

    @State
    private var state: RecordActionView.State = .idle

    var body: some View {
        SensorTrackRecordActionView(state: $state)
            .edgesIgnoringSafeArea(.all)
            .toolbar {
                ToolbarItem(placement: .status) {
                    Picker("State Picker", selection: $state.animation(.spring())) {
                        ForEach(RecordActionView.State.allCases, id: \.self) {
                            Text($0.label)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
    }
}

extension RecordActionView.State {

    /// Quick hack to make the demo's segmented control easier to create.
    var label: String {
        switch self {
        case .idle:
            return "Idle"
        case .waiting:
            return "Waiting"
        case .recordingArmed:
            return "Armed"
        case .recording:
            return "Recording"
        }
    }
}

struct RecordActionDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RecordActionDemoView()
            }
            .preferredColorScheme(.dark)
        }
    }
}
