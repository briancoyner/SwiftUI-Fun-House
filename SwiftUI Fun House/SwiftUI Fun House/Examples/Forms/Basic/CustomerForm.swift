//
//  Created by Brian Coyner on 7/28/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import CoreData
import SwiftUI

struct CustomerForm: View {
    
    @StateObject
    private var customer = Customer()

    var body: some View {
        Form {
            Section {
                TextField("customer-form.first-name.label", text: $customer.firstName)
                    .formLabel("customer-form.first-name.label")
                    .required()

                TextField("customer-form.last-name.label", text: $customer.lastName)
                    .formLabel("customer-form.last-name.label")
                    .optional()

                Toggle("customer-form.is-favorite.label", isOn: $customer.isFavorite.animation())

                if customer.isFavorite {
                    Label("customer-form.celebrate.label", systemImage: "heart.fill")
                }

                let validator = CustomerFirstNameIsNotBrianValidator(customer: customer)
                ValidatingTextField("customer-form.first-name.label", text: $customer.lastName, validator: validator)
                    .optional()
            }

            Section {
                Button("customer-form.print-button.label") {
                    print("Customer: \(self.customer.firstName) \(self.customer.lastName)")
                }
            }
        }
        .navigationBarTitle(customer.firstName)
    }
}

#if DEBUG
struct CustomerForm_Previews : PreviewProvider {
    static var previews: some View {
        CustomerForm()
            .environment(\.sizeCategory, .small)
    }
}
#endif
