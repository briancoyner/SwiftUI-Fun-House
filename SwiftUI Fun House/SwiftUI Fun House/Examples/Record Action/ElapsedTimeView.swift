//
//  Created by Brian Coyner on 9/21/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI
import Combine

struct ElapsedTimeView: View {

    let referenceDate: Date

    private let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
        // .print() // uncomment this to prove that the timer is cancelled when the user leaves the SensorTrack demo.

    @State private var currentDate = Date()

    // The current environment's font is transformed into a monospaced digit font.
    // If the font is not set then a `subheadline` monospaced digit font is used.
    @Environment(\.font) private var currentFont

    var body: some View {
        Text(self.elapsedTime(from: referenceDate, to: currentDate))
            .font(self.font(basedOn: currentFont))
            .onReceive(timer) { input in
                self.currentDate = input
            }
            .onDisappear() {
                timer.upstream.connect().cancel()

                // If you uncomment the `print` above, then you need to go "upstream" one more time.
                // timer.upstream.upstream.connect().cancel()
            }
    }
}

extension ElapsedTimeView {

    private func font(basedOn font: Font?) -> Font {
        if let font = font {
            return font.monospacedDigit()
        } else {
            return Font.subheadline.monospacedDigit()
        }
    }
}

extension ElapsedTimeView {

    private func elapsedTime(from startDate: Date, to date: Date) -> String {
        let elapsedTime = startDate.distance(to: date)
        return ElapsedTimeView.formatter.string(from: elapsedTime) ?? localizedUnknownElapsedTime
    }

    private var localizedUnknownElapsedTime: String {
        return NSLocalizedString(
            "sensor-track-button.unknown-elapsed-time.text",
            comment: "The label to display if the elapsed time value cannot be determined."
        )
    }
}

extension ElapsedTimeView {

    private static var formatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour]
        formatter.allowsFractionalUnits = false
        formatter.unitsStyle = .short
        return formatter
    }
}
