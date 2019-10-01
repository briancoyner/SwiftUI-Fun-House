//
//  Created by Brian Coyner on 7/11/19.
//  Copyright © 2019 Brian Coyner. All rights reserved.
//

import Foundation
import UIKit

extension String.StringInterpolation {
    
    mutating func appendInterpolation<Numeric>(format value: Numeric, using style: NumberFormatter.Style) {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        if let result = formatter.string(from: value as! NSNumber) {
            appendLiteral(result)
        }
    }
}
