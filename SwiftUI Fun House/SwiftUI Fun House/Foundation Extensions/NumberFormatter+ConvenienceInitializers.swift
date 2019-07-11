//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    convenience init(style: NumberFormatter.Style) {
        self.init()
        self.numberStyle = style
    }
}
