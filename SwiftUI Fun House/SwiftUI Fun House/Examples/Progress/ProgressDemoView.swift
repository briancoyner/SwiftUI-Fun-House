//
//  ProgressDemoView.swift
//  SwiftUI Fun House
//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct ProgressDemoView : View {
    
    @State var progress: Double = 0.0
    
    var body: some View {
        
        VStack {
            Slider(value: $progress.animation(), from: 0.0, through: 1.0, by: 0.01)
            ProgressView(progress: progress)
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
