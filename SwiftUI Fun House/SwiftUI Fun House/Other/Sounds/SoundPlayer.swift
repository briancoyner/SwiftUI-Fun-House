//
//  Created by Brian Coyner on 9/21/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import AudioToolbox

public class SoundPlayer {

    public enum SoundIdentifier: SystemSoundID {
        case beginRecording = 1113
        case endRecording = 1114
    }

    public static func play(_ identifier: SoundIdentifier) {
        AudioServicesPlaySystemSoundWithCompletion(identifier.rawValue, nil)
    }
}
