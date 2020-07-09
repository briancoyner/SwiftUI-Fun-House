//
//  Created by Brian Coyner on 7/28/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import CoreData
import Combine
import SwiftUI

struct CustomerForm: View {
    
    @StateObject
    private var customer = Customer()

    var body: some View {
        Form {
            Section {
                TextField("customer-form.first-name.label", text: $customer.firstName)
                    .formLabel("customer-form.first-name.label")

                TextField("customer-form.last-name.label", text: $customer.lastName)
                    .formLabel("customer-form.last-name.label")

                Toggle("customer-form.is-favorite.label", isOn: $customer.isFavorite.animation())

                if customer.isFavorite {
                    Label("customer-form.celebrate.label", systemImage: "heart.fill")
                }
            }

            Section {
                DatePicker("customer-form.birthdate.label", selection: $customer.birthDate, displayedComponents: [.date])
            }

            Section {
                Button("customer-form.print-button.label") {
                    print("Customer: \(self.customer.firstName) \(self.customer.lastName)")
                }
            }
        }
        //.disabled(true)
        .navigationBarTitle(customer.firstName)
    }
}

#if DEBUG
struct CustomerForm_Previews : PreviewProvider {
    static var previews: some View {
        CustomerForm()
    }
}
#endif

