//
//  Created by Brian Coyner on 6/29/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import SwiftUI

extension View {

    /// Wraps the view in a leading aligned `VStack` with a text label sitting above the view.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of the text field, describing its purpose.
    ///   - bundle: the bundle containing the localized string for the given key; if `nil` then the main bundle is used.
    /// - Returns: a new view that wraps this view in a leading aligned `VStack` with a text label sitting above this view.
    public func label(_ titleKey: LocalizedStringKey, bundle: Bundle? = nil) -> some View {
        VStack(alignment: .leading) {
            Text(titleKey, bundle: bundle)
            self
        }
    }
}
