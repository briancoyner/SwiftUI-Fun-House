//
//  Created by Brian Coyner on 7/28/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import CoreData
import Combine
import SwiftUI

struct CustomerForm: View {
    
    @ObservedObject
    private var customer = Customer()

    var body: some View {
        Form {
            Section {
                TextField("customer-form.first-name.label", text: $customer.firstName)
                TextField("customer-form.last-name.label", text: $customer.lastName)
                Toggle("customer-form.is-favorite.label", isOn: $customer.isFavorite)

                if customer.isFavorite {
                    Text(customer.firstName)
                }

                Button("customer-form.print-button.label") {
                    print("Customer: \(self.customer.firstName) \(self.customer.lastName)")
                }
            }
        }.navigationBarTitle(customer.firstName)
    }
}
