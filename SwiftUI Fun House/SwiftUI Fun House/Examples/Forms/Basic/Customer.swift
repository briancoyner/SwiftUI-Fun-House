//
//  Created by Brian Coyner on 10/2/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation


enum CustomerError: LocalizedError {

    case firstNameIsNotBrian
}

struct CustomerFirstNameIsNotBrianValidator: Validator {

    let customer: Customer

    func validate() -> ValidationResult {
        if customer.lastName != "Brian" {
            return .error(CustomerError.firstNameIsNotBrian)
        } else {
            return .ok
        }
    }
}

final class Customer: ObservableObject {
    @Published var firstName: String = "Brian"
    @Published var lastName: String = "Coyner"
    @Published var birthDate: Date = Date()
    @Published var isFavorite = false
}
