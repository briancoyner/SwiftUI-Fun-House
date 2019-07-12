//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct ProgressDemoView : View {
    
    private enum ProgressViewState: Hashable {
        case indeterminate
        case progress(Double = 0.0)
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .indeterminate:
                hasher.combine(1)
            case .progress(_):
                hasher.combine(2)
            }
        }
    }
    
    @State private var state: ProgressViewState = .progress(0)
    @State private var selectedColor: Color = .blue
    @State private var progress: Double = 0.0
    
    var body: some View {
        VStack {
            ProgressView(color: selectedColor, progress: progress)
            Divider()
            Section {
                SegmentedControl(selection: $state) {
                    Text("Indeterminate").tag(ProgressViewState.indeterminate)
                    Text("Progress").tag(ProgressViewState.progress())
                }
                SegmentedControl(selection: $selectedColor) {
                    ForEach([Color.blue, .green, .gray, .red].identified(by: \.self)) { color in
                        Text(String(describing: color).capitalized).tag(color)
                    }
                }
                Slider(value: $progress.animation(), from: 0.0, through: 1.0, by: 0.01)
            }
        }.padding()
    }
}

#if DEBUG
struct ProgressDemoView_Previews : PreviewProvider {
    static var previews: some View {
        ProgressDemoView()
    }
}
#endif
