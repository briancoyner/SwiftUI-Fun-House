//
//  Created by Brian Coyner on 7/15/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

@Observable
final class ProgressDemoProperties {
    var selectedColor: Color = .blue
    var progress: CGFloat = 0.25
}
