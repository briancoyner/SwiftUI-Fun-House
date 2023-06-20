import SwiftUI

/// Views/ rows displayed in a `Form` should adopt this protocol to enable adding a "form label"  using
/// the `formLabel(_:tableName:bundle:)` method.
@MainActor
public protocol FormLabelCapable {
}

extension Text: FormLabelCapable { }
extension DatePicker: FormLabelCapable { }
extension TextField: FormLabelCapable { }
extension Slider: FormLabelCapable { }
