//
//  View+FormLabel.swift
//  SwiftUI Fun House
//
//  Created by Brian Coyner on 6/8/22.
//  Copyright © 2022 Brian Coyner. All rights reserved.
//

import SwiftUI

extension View where Self: FormLabelCapable {

    /// Wraps the view in a leading aligned `VStack` with a text label sitting above the view.
    /// This is helpful when form-based views display lots of values whose meaning requires a label.
    ///
    /// Internally this uses a `LabeledContent` view using the `FormLabelContentStyle`.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field, describing its purpose.
    ///   - tableName: The name of the string table to search. If `nil`, use the  table in the `Localizable.strings` file.
    ///   - bundle: the bundle containing the localized string for the given key; if `nil` then the main bundle is used.
    /// - Returns: a new view that wraps this view in a leading aligned `VStack` with a text label sitting above this view.
    public func formLabel(_ titleKey: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil) -> some View {
        LabeledContent {
            self
        } label: {
            Text(titleKey, tableName: tableName, bundle: bundle)
        }
        .labeledContentStyle(FormLabelContentStyle())
    }
}
