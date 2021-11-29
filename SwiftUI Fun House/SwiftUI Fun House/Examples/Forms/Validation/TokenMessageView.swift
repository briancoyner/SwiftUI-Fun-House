//
//  Created by Brian Coyner on 3/27/21.
//  Copyright © 2021 Brian Coyner. All rights reserved.
//

import SwiftUI

struct TokenMessageView: View {

    let titleKey: LocalizedStringKey
    let message: String

    var body: some View {
        HStack(alignment: .top) {
            Text(titleKey)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .background(
                    AdaptiveRoundedRectangle(byRoundingCorners: .left, cornerRadius: 4)
                        .fill(Color.accentColor)
                        .padding(.horizontal, -4)
                )
            Text(message)
                .lineLimit(1)

            Spacer()
        }
        .font(.footnote)
        .background(
            HStack {
                AdaptiveRoundedRectangle(byRoundingCorners: .right, cornerRadius: 4)
                    .stroke(Color.accentColor, lineWidth: 1)
            }
        )
    }
}

struct TokenMessageView_Previews: PreviewProvider {
    static var previews: some View {
        TokenMessageView(titleKey: "First Name", message: "The first name cannot be 'Brian'.")
            .padding()
    }
}
