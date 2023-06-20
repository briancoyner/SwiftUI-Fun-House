//
//  Created by Brian Coyner on 3/27/21.
//  Copyright © 2021 Brian Coyner. All rights reserved.
//

import SwiftUI

/// The use of `listRowBackground` to help anchor the "annotation bar" to the leading edge of the cell works, but then selection/ highlighting is lost.
extension View {

    func annotated(as style: FormFieldAnnotation.Style) -> some View {
        return listRowBackground(
            FormFieldAnnotation(style: style)
        )
    }

    func required() -> some View {
        return listRowBackground(
            FormFieldAnnotation(style: .required)
        )
    }

    func optional() -> some View {
        return listRowBackground(
            FormFieldAnnotation(style: .optional)
        )
    }
}
