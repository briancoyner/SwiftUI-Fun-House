//
//  Created by Brian Coyner on 3/27/21.
//  Copyright © 2021 Brian Coyner. All rights reserved.
//

import SwiftUI

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
