import SwiftUI

struct BarberPoleView: View {

    let primaryColor: Color
    let secondaryColor: Color
}

extension BarberPoleView {
    var body: some View {
        GeometryReader { context in
            let stripeHeight: CGFloat = context.size.height / 10
            let rows = Int(context.size.height / stripeHeight)
            VStack(spacing: 0) {
                ForEach(0..<rows+2, id: \.self) { index in
                    let color = index % 2 == 0 ? primaryColor : secondaryColor
                    Rectangle()
                        .fill(color)
                        .frame(width: stripeHeight * 10, height: stripeHeight)
                }
            }
            .rotationEffect(.degrees(-45))
            .offset(CGSize(width: -stripeHeight * 4, height: -stripeHeight))
            .clipShape(Rectangle().size(CGSize(width: 5.0, height: context.size.height)))
        }
    }
}

#Preview {
    BarberPoleView(primaryColor: .red, secondaryColor: .yellow)
        .frame(width: 5, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
}
