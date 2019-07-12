//
//  ProgressView.swift
//  SwiftUI Fun House
//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    
    var color: Color
    var progress: Double = 0.0
    
    var body: some View {
        
        GeometryReader { context in
            ZStack {
                Text(verbatim: "\(format: self.progress, using: .percent)")
                    .color(self.color)
                    .font(.system(size: context.size.width * 0.15))
                Group {
                    RingShape(endAngle: .degrees(360))
                        .stroke(Color.gray, lineWidth: Length(4))
                    RingShape(endAngle: .degrees(360))
                        .trim(from: 0, to: CGFloat(self.progress))
                        .stroke(self.color, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                }
                .rotationEffect(.degrees(-90))
            }
            .padding()
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

#if DEBUG
struct ProgressView_Previews : PreviewProvider {
    static var previews: some View {
        ProgressView(color: .blue, progress: 33)
    }
}
#endif
