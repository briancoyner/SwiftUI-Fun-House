//
//  Created by Brian Coyner on 10/2/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation

final class Customer: ObservableObject {
    @Published var firstName: String = "Brian"
    @Published var lastName: String = "Coyner"
    @Published var birthDate: Date = Date()
    @Published var isFavorite = false
}
