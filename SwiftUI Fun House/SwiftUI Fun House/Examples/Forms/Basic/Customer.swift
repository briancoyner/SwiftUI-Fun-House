//
//  Created by Brian Coyner on 10/2/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import SwiftUI

enum CustomerError: LocalizedError {
    case firstNameIsNotBrian

    var errorDescription: String? {
        switch self {
        case .firstNameIsNotBrian:
            return "First name must be 'Brian'"
        }
    }
}

struct CustomerFirstNameIsNotBrianValidator: Validator {

    let customer: Customer

    func validate() -> ValidationResult? {
        if customer.firstName != "Brian" {
            return .error(CustomerError.firstNameIsNotBrian)
        } else {
            return nil
        }
    }
}

@Observable
final class Customer: ObservableObject {
    var firstName: String = "Brian"
    var lastName: String = "Coyner"
    var birthDate: Date = Date()
    var isFavorite = false

    var firstNameValidation: (any LocalizedError)? = nil
}
