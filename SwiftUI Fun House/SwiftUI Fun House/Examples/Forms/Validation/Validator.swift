//
//  Created by Brian Coyner on 3/27/21.
//  Copyright © 2021 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

enum ValidationResult {
    case warning(any LocalizedError)
    case error(any LocalizedError)
}

@MainActor
protocol Validator {

    /// Implementations return a `ValidationResult` if the validation fails or `nil` if validation succeeds.
    func validate() -> ValidationResult?
}
