//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import SwiftUI

struct ProgressView<AdditionalContent>: View where AdditionalContent : View {
    var color: Color
    var progress: CGFloat
    
    private let additionalContent: AdditionalContent
    
    init(color: Color, progress: CGFloat, additionalContent: () -> AdditionalContent) {
        self.color = color
        self.progress = progress
        self.additionalContent = additionalContent()
    }
    
    var body: some View {
        GeometryReader { [color, progress] context in
            ZStack {
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(color, lineWidth: self.progressLineWidth(basedOn: context.size))
                    .rotationEffect(.degrees(-90))
                self.additionalContent
                    .frame(width: context.size.width, height: context.size.height, alignment: .center)
                    .cornerRadius(context.size.width * 0.05)
                    .foregroundColor(color)
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
    
    fileprivate func progressLineWidth(basedOn size: CGSize) -> CGFloat {
        return floor(max(radius(baseOn: size) * 0.15, 2.0))
    }
    
    fileprivate func radius(baseOn size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.5
    }
}
