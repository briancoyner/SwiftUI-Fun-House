//
//  Created by Brian Coyner on 7/28/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import CoreData
import SwiftUI

/// - Note: trying out a bunch of different API ideas for how to handle field-level validation in a consistent way across apps that have tons of
/// editable form sheets.
///
/// - Note: trying out different API techniques for annotating if a field is required or optional.
///
/// - Note: trying out different API ideas for how to display `TextField`s that need an additional label to denote what the value represents.
struct CustomerForm: View {
    
    @Bindable
    private var customer = Customer()

    private var customerFirstNameIsNotBrianValidator: any Validator {
        return CustomerFirstNameIsNotBrianValidator(customer: customer)
    }

    var body: some View {
        Form {
            Section {
                DatePicker("Birthday Party", selection: $customer.birthDate)
                    .datePickerStyle(AdaptiveDatePickerStyle())
                
                DatePicker("Birthday", selection: $customer.birthDate)
                    .datePickerStyle(AdaptiveDatePickerStyle())
                
                
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
                
                TextField("First Name", text: $customer.firstName.animation())
                    .formField("First Name", validator: customerFirstNameIsNotBrianValidator)
                    .optional()
            }

            Section {
                FormField("customer-form.first-name.label", validator: customerFirstNameIsNotBrianValidator) { title in
                    TextField(title, text: $customer.firstName)
                }
                .required()

                FormField("customer-form.last-name.label") { title in
                    TextField(title, text: $customer.lastName)
                }
                .optional()
            }

            Section {
                Button("customer-form.print-button.label") {
                    print("Customer: \(self.customer.firstName) \(self.customer.lastName)")
                }
            }
        }
        .navigationTitle(customer.firstName)
    }
}

#Preview {
    CustomerForm()
}
