//
//  Created by Brian Coyner on 3/27/21.
//  Copyright © 2021 Brian Coyner. All rights reserved.
//

import SwiftUI

struct FormFieldAnnotation: View {

    let style: Style

    init(style: Style) {
        self.style = style
    }
}

extension FormFieldAnnotation {

    var body: some View {
        HStack(spacing: 0) {
            switch style {
            case .optional:
                BarberPoleView(primaryColor: Color(.darkGray), secondaryColor: Color(.lightGray))
            case .required:
                BarberPoleView(primaryColor: .blue, secondaryColor: Color.blue.opacity(0.5))
            }
        }
        .background(Color(.secondarySystemGroupedBackground))
    }

    private func color(for style: Style) -> Color {
        switch style {
        case .optional:
            return .gray
        case .required:
            return .blue
        }
    }
}

extension FormFieldAnnotation {
    enum Style {
        case required
        case optional
    }
}
