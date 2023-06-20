//
//  Created by Brian Coyner on 7/8/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

struct FormField<Content>: View, FormLabelCapable where Content: View & FormLabelCapable {

    private let titleKey: LocalizedStringKey
    private let validator: Validator?
    private let content: (LocalizedStringKey) -> Content

    init(_ titleKey: LocalizedStringKey, validator: Validator? = nil, content: @escaping (LocalizedStringKey) -> Content) {
        self.titleKey = titleKey
        self.validator = validator
        self.content = content
    }
}

extension FormField {
    
    var body: some View {
        content(titleKey)
            .formField(titleKey, validator: validator)
    }
}

extension View where Self: FormLabelCapable {

    @MainActor
    func formField(_ titleKey: LocalizedStringKey, validator: Validator? = nil) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                switch validator?.validate() {
                case .none:
                    Text(titleKey)
                        .foregroundColor(.secondary)
                case .error(let error):
                    TokenMessageView(titleKey: titleKey, message: error.localizedDescription)
                        .accentColor(.red)
                case .warning(let error):
                    TokenMessageView(titleKey: titleKey, message: error.localizedDescription)
                        .accentColor(.orange)
                }
            }
            .font(.subheadline)

            self
        }
    }
}
