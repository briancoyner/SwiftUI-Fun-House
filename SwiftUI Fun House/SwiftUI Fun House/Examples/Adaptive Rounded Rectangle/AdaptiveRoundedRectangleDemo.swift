import SwiftUI

/// A very simply demo view that allows for rounding the corners of an `AdaptiveRoundedRectangle`.

struct AdaptiveRoundedRectangleDemo: View {

    @State
    private var corners: AdaptiveRoundedRectangle.Corner = .all

    @State
    private var cornerRadius: CGFloat = 11

    @State
    private var drawRadius: Bool = true

    @State
    private var topLeft: Bool = true

    @State
    private var topRight: Bool = true

    @State
    private var bottomLeft: Bool = true

    @State
    private var bottomRight: Bool = true

    @State
    private var height: CGFloat = 100

    var body: some View {
        VStack {
            AdaptiveRoundedRectangle(byRoundingCorners: corners, cornerRadius: cornerRadius)
                .fill(Color.blue)
                .frame(width: 300, height: height, alignment: .center)

            AdaptiveRoundedRectangle(byRoundingCorners: corners, cornerRadius: cornerRadius)
                .stroke(Color.blue)
                .frame(width: 300, height: height, alignment: .center)

            Spacer()

            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Height")
                    Slider(value: $height, in: 44...CGFloat(100))
                }

                Divider()

                VStack(alignment: .leading, spacing: 0) {
                    Text("Corner Radius")
                    Slider(value: $cornerRadius, in: 0...CGFloat(height / 2))
                }

                Toggle("Radius?", isOn: $drawRadius)

                Divider()

                Toggle("Top Left", isOn: $topLeft)
                Toggle("Top Right", isOn: $topRight)
                Toggle("Bottom Left", isOn: $bottomLeft)
                Toggle("Bottom Right", isOn: $bottomRight)
            }
        }
        .onChange(of: drawRadius) { value in
            withAnimation {
                cornerRadius = value ? 22 : 0
            }
        }
        .onChange(of: topLeft) { value in
            animateCornerChange()
        }
        .onChange(of: topRight) { value in
            animateCornerChange()
        }
        .onChange(of: bottomLeft) { value in
            animateCornerChange()
        }
        .onChange(of: bottomRight) { value in
            animateCornerChange()
        }
        .padding()
    }

    // This method is a bit heavy handed in that it blindly recalculates
    // and mutates the `corners` property. This is fine for the demo.
    private func animateCornerChange() {
        withAnimation {
            if topLeft {
                corners.insert(.topLeft)
            } else {
                corners.remove(.topLeft)
            }

            if topRight {
                corners.insert(.topRight)
            } else {
                corners.remove(.topRight)
            }

            if bottomLeft {
                corners.insert(.bottomLeft)
            } else {
                corners.remove(.bottomLeft)
            }

            if bottomRight {
                corners.insert(.bottomRight)
            } else {
                corners.remove(.bottomRight)
            }
        }
    }
}

struct AdaptiveRoundedRectangleDemo_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveRoundedRectangleDemo()
    }
}
