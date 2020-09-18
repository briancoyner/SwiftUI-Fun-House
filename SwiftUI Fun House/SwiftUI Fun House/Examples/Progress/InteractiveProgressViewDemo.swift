//
//  Created by Brian Coyner on 9/17/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

/// A demo showing the custom `InteractiveProgressViewStyle` attached to a `ProgressView`
struct InteractiveProgressViewDemo : View {

    @ObservedObject private var properties = ProgressDemoProperties()

    var body: some View {
        VStack {
            List {
                Cell(
                    fileName: "database1.sqlite",
                    size: 2_345_876,
                    date: Date(),
                    progress: Double(properties.progress)
                )

                Cell(
                    fileName: "My Other Data.sqlite",
                    size: 28_183_871,
                    date: Date(),
                    progress: Double(properties.progress)
                )
            }

            Divider().padding([.top, .bottom])

            ProgressDemoPropertiesView(properties: properties)
        }
        .accentColor(properties.selectedColor)
        .padding()
    }
}

private struct Cell: View {

    let fileName: String
    let size: Int64
    let date: Date

    var progress: Double

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fileName)
                    .font(.headline)

                Text(DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .short))
                    .font(.subheadline)

                Text(ByteCountFormatter.string(fromByteCount: size, countStyle: .file))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            ProgressView("Prominent Style", value: progress)
                .progressViewStyle(InteractiveProgressViewStyle())
                .frame(minWidth: 44, idealWidth: 44 , maxWidth: 64)
                .padding([.top, .bottom], 8)
        }
    }
}

struct InteractiveProgressViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveProgressViewDemo()
    }
}
