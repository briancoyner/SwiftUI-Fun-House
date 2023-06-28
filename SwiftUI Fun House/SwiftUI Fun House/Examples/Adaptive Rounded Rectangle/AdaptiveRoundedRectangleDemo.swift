import SwiftUI

/// A very simply demo view that allows for rounding the corners of an `AdaptiveRoundedRectangle`.

struct AdaptiveRoundedRectangleDemo: View {

    @State private var corners: AdaptiveRoundedRectangle.Corner = .all
    @State private var cornerRadius: CGFloat = 11
    @State private var drawRadius: Bool = true
    @State private var topLeft: Bool = true
    @State private var topRight: Bool = true
    @State private var bottomLeft: Bool = true
    @State private var bottomRight: Bool = true
    @State private var height: CGFloat = 100

    var body: some View {
        List {
            AdaptiveRoundedRectangle(byRoundingCorners: corners, cornerRadius: cornerRadius)
                .fill(Color.blue)
                .frame(height: height, alignment: .center)
                .padding(.horizontal)

            AdaptiveRoundedRectangle(byRoundingCorners: corners, cornerRadius: cornerRadius)
                .stroke(Color.blue)
                .frame(height: height, alignment: .center)
                .padding(.horizontal)
                
            Section {
                
                VStack(alignment: .leading, spacing: 0) {
                    Slider(value: $height, in: 44...CGFloat(100))
                        .formLabel("Height")
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Slider(value: $cornerRadius, in: 0...CGFloat(height / 2))
                        .formLabel("Corner Radius")
                }
                
                Toggle("Radius?", isOn: $drawRadius)
                Toggle("Top Left", isOn: $topLeft)
                Toggle("Top Right", isOn: $topRight)
                Toggle("Bottom Left", isOn: $bottomLeft)
                Toggle("Bottom Right", isOn: $bottomRight)
            }
        }
        .padding()
        .onChange(of: drawRadius) { _, value in
            withAnimation {
                cornerRadius = value ? 22 : 0
            }
        }
        .onChange(of: topLeft) { _, value in
            animateCornerChange()
        }
        .onChange(of: topRight) { _, value in
            animateCornerChange()
        }
        .onChange(of: bottomLeft) { _, value in
            animateCornerChange()
        }
        .onChange(of: bottomRight) { _, value in
            animateCornerChange()
        }
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

#Preview {
    AdaptiveRoundedRectangleDemo()
}
