//
//  Created by Brian Coyner on 3/27/21.
//  Copyright © 2021 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

enum ValidationResult {
    case ok
    case warning(LocalizedError)
    case error(LocalizedError)
}

protocol Validator {

    func validate() -> ValidationResult
}
