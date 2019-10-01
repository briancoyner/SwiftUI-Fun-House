//
//  Created by Brian Coyner on 7/15/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class ProgressDemoProperties: ObservableObject {
    
    @Published
    var selectedColor: Color = .blue
    
    @Published
    var progress: CGFloat = 0.25
}
