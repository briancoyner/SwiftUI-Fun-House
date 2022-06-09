import SwiftUI

struct FormLabelContentStyle: LabeledContentStyle {

    func body(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            configuration.label
                .font(.subheadline)
                .foregroundColor(.secondary)
            configuration.content
        }
    }
}
