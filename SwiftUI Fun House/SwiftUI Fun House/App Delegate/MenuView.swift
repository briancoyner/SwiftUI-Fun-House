//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct MenuView : View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Animatable Data")) {
                    NavigationLink("Sine Wave", destination: SineWaveDemoView())
                    NavigationLink("Lissajous", destination: LissajousDemoView())
                }
                Section(header: Text("Circular Progress Views")) {
                    NavigationLink("Simple `Circle`", destination: SimpleCircleProgressDemoView())
                    NavigationLink("Simple `PieSlice`", destination: SimplePieSliceProgressDemoView())
                    NavigationLink("Simple `ProgressView`", destination: SimpleProgressViewDemo())
                    NavigationLink("Contextual `ProgressView`", destination: ContextualProgressViewDemo())
                    NavigationLink("Indeterminate Progress", destination: IndeterminateProgressDemoView())
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
