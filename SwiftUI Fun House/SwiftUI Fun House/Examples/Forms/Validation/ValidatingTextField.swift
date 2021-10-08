//
//  Created by Brian Coyner on 3/27/21.
//  Copyright © 2021 Brian Coyner. All rights reserved.
//

import SwiftUI

struct ValidatingTextField: View {

    private let titleKey: LocalizedStringKey
    private let binding: Binding<String>

    private let validator: Validator

    init(_ titleKey: LocalizedStringKey, text: Binding<String>, validator: Validator) {
        self.titleKey = titleKey
        self.binding = text
        self.validator = validator
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Group {
                switch validator.validate() {
                case .none:
                    Text(titleKey)
                        .foregroundColor(.accentColor)
                case .error(let error):
                    TokenMessageView(titleKey: titleKey, message: error.localizedDescription)
                        .accentColor(.red)
                case .warning(let error):
                    TokenMessageView(titleKey: titleKey, message: error.localizedDescription)
                        .accentColor(.orange)
                }
            }
            .font(.caption)

            TextField(titleKey, text: binding.animation())
        }
    }
}
