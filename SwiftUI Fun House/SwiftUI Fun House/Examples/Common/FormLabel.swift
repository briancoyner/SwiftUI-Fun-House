//
//  Created by Brian Coyner on 7/8/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

/// Views/ rows displayed in a `Form` should adopt this protocol to enable adding a "form label"  using
/// the `formLabel(_:tableName:bundle:)` method.
public protocol FormLabelCapable {
}

extension View where Self: FormLabelCapable {

    /// Wraps the view in a leading aligned `VStack` with a text label sitting above the view.
    /// This is helpful when form-based views display lots of values whose meaning requires a label.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field, describing its purpose.
    ///   - tableName: The name of the string table to search. If `nil`, use the  table in the `Localizable.strings` file.
    ///   - bundle: the bundle containing the localized string for the given key; if `nil` then the main bundle is used.
    /// - Returns: a new view that wraps this view in a leading aligned `VStack` with a text label sitting above this view.
    public func formLabel(_ titleKey: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(titleKey, tableName: tableName, bundle: bundle)
                .font(.caption)
                .foregroundColor(.accentColor)
            self
        }
    }
}

extension Text: FormLabelCapable { }
extension DatePicker: FormLabelCapable { }
extension TextField: FormLabelCapable { }
extension TextEditor: FormLabelCapable { }
