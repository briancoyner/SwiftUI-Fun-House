//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct MenuView : View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink("Lissajous", destination: LissajousDemoView())
                }
                Section {
                    NavigationLink("Progress", destination: ProgressDemoView())
                }
            }.navigationBarTitle("SwiftUI Fun House")
        }
    }
}

#if DEBUG
struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif
