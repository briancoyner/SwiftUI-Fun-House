import SwiftUI

struct AdaptiveDatePickerStyle: DatePickerStyle {

    @Environment(\.dynamicTypeSize)
    private var dynamicTypeSize

    func makeBody(configuration: Configuration) -> some View {
        ViewThatFits {
            DatePicker(
                selection: configuration.$selection,
                displayedComponents: configuration.displayedComponents,
                label: { configuration.label }
            )

            VStack(alignment: .leading, spacing: 0) {
                configuration.label
                HStack {
                    Spacer()
                    DatePicker(selection: configuration.$selection, displayedComponents: configuration.displayedComponents) {
                        configuration.label
                    }
                    .labelsHidden()
                }
            }
        }
    }
}
