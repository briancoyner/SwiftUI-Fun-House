import SwiftUI

/// This demo is based on the following article from John D. Cook: https://www.johndcook.com/blog/2023/06/18/circle-through-three-points
///
/// - SeeAlso: ``ThreePointCircleModel`` for the equation John D. Cook mentions in his article.
struct ThreePointCircleDemo: View {

    @State
    private var points: [ThreePointCircleModel] = []

    @GestureState
    private var currentDrag: DragGesture.Value? = nil

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color(uiColor: .systemBackground)
            ForEach(points, id: \.id) { model in
                Circle()
                    .fill(Color.accentColor)
                    .frame(width: 14, height: 14)
                    .offset(x: model.point.x - 7, y: model.point.y - 7)
            }
        }
        .overlay(alignment: .topLeading) {
            if points.count == 3 {
                let (center, radius) = deriveCircle(
                    point1: points[0].point,
                    point2: points[1].point,
                    point3: points[2].point
                )

                Circle()
                    .stroke(Color.accentColor)
                    .frame(width: radius * 2, height: radius * 2)
                    .offset(x: center.x - radius, y: center.y - radius)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .updating($currentDrag, body: { (value, state, _) in
                    state = value
                })
                .onEnded { state in
                    if points.count == 3 {
                        points = []
                    }
                    points.append(ThreePointCircleModel(point: state.startLocation))
                }
        )
        .navigationTitle("Three Point Circle")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Clear") {
                    points = []
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
