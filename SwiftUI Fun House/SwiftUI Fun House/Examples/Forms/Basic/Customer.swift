//
//  Created by Brian Coyner on 10/2/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation

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
        if let error = customer.firstNameValidation {
            return .error(error)
        } else {
            return nil
        }

//        if customer.lastName != "Brian" {
//            return .error(CustomerError.firstNameIsNotBrian)
//        } else {
//            return nil
//        }
    }
}

final class Customer: ObservableObject {
    @Published var firstName: String = "Brian" {
        didSet {
            if firstName != "Brian" {
                firstNameValidation = CustomerError.firstNameIsNotBrian
            } else {
                firstNameValidation = nil
            }
        }
    }

    @Published var lastName: String = "Coyner"
    @Published var birthDate: Date = Date()
    @Published var isFavorite = false

    var firstNameValidation: LocalizedError?
}
