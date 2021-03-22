import SwiftUI

/// The `SwiftUI/RoundedRectangle` does not currently allow for selecting with corners to round.
///
/// The `AdaptiveRoundedRectangle` allows for zero or more corners to be rounded using a single corner radius value.
/// This is similar to the `UIKIt/UIBezierPath` API.
///
/// The corner radius is animatable.
/// The corners are animatable.
struct AdaptiveRoundedRectangle: Shape {

    private let corners: Corner
    private var cornerRadius: CGFloat

    private var topLeft: CGFloat
    private var topRight: CGFloat
    private var bottomLeft: CGFloat
    private var bottomRight: CGFloat

    /// This is a bit crazy to read. This represents five animatable properties (all four corners + corner radius).
    var animatableData: AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>, CGFloat> {
        get {
            .init(.init(.init(topLeft, topRight), .init(bottomLeft, bottomRight)), cornerRadius)
        }
        set {
            topLeft = newValue.first.first.first
            topRight = newValue.first.first.second
            bottomLeft = newValue.first.second.first
            bottomRight = newValue.first.second.second
            cornerRadius = newValue.second
        }
    }

    init(byRoundingCorners corners: Corner, cornerRadius: CGFloat) {
        self.corners = corners
        self.cornerRadius = cornerRadius

        self.topLeft = Self.clampRadius(for: .topLeft, clampedTo: cornerRadius, corners: corners)
        self.topRight = Self.clampRadius(for: .topRight, clampedTo: cornerRadius, corners: corners)
        self.bottomLeft = Self.clampRadius(for: .bottomLeft, clampedTo: cornerRadius, corners: corners)
        self.bottomRight = Self.clampRadius(for: .bottomRight, clampedTo: cornerRadius, corners: corners)
    }
}

extension AdaptiveRoundedRectangle {

    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height

            // Clamp the radius to ensure it does not exceed the rect's size.
            let clampedRadius = min(min(cornerRadius, height / 2), width / 2)

            let topLeft = min(topLeft, clampedRadius)
            let topRight = min(topRight, clampedRadius)
            let bottomLeft = min(bottomLeft, clampedRadius)
            let bottomRight = min(bottomRight, clampedRadius)

            // Start in the middle (we'll close the path at the end)
            path.move(to: CGPoint(x: width / 2, y: 0))

            // Draw the top line (starting from the middle) and top-right corner
            path.addLine(to: CGPoint(x: width - topRight, y: 0))
            path.addArc(
                center: CGPoint(x: width - topRight, y: topRight),
                radius: topRight,
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )

            // Draw the right edge and bottom-right corner
            path.addLine(to: CGPoint(x: width, y: height - bottomRight))
            path.addArc(
                center: CGPoint(x: width - bottomRight, y: height - bottomRight),
                radius: bottomRight,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )

            // Draw the bottom edge and bottom-left corner
            path.addLine(to: CGPoint(x: bottomLeft, y: height))
            path.addArc(
                center: CGPoint(x: bottomLeft, y: height - bottomLeft),
                radius: bottomLeft,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )

            // Draw the left edge and the top-left corner
            path.addLine(to: CGPoint(x: 0, y: topLeft))
            path.addArc(
                center: CGPoint(x: topLeft, y: topLeft),
                radius: topLeft,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false
            )

            // Close the path to complete the shape
            path.closeSubpath()
        }
    }
}

extension AdaptiveRoundedRectangle {

    private static func clampRadius(for corner: Corner, clampedTo clampedRadius: CGFloat, corners: Corner) -> CGFloat {
        return corners.contains(corner) ? clampedRadius : 0.0
    }
}

extension AdaptiveRoundedRectangle {

    struct Corner: OptionSet {

        let rawValue: Int
        static let topLeft = Corner(rawValue: 1 << 0)
        static let topRight  = Corner(rawValue: 1 << 1)
        static let bottomLeft   = Corner(rawValue: 1 << 2)
        static let bottomRight   = Corner(rawValue: 1 << 3)

        static let left: Corner = [.topLeft, .bottomLeft]
        static let right: Corner = [.topRight, .bottomRight]
        static let all: Corner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
    }
}
