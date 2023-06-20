import Foundation

struct ThreePointCircleModel: Identifiable, Equatable {

    let id = UUID()
    let point: CGPoint
}

/// https://www.johndcook.com/blog/2023/06/18/circle-through-three-points/
func deriveCircle(point1: CGPoint, point2: CGPoint, point3: CGPoint) -> (center: CGPoint, radius: CGFloat) {
    let s1 = pow(point1.x, 2) + pow(point1.y, 2)
    let s2 = pow(point2.x, 2) + pow(point2.y, 2)
    let s3 = pow(point3.x, 2) + pow(point3.y, 2)

    let m11 = (point1.x * point2.y) + (point2.x * point3.y) + (point3.x * point1.y) - ((point2.x * point1.y) + (point3.x * point2.y) + (point1.x * point3.y))
    let m12 = (s1 * point2.y) + (s2 * point3.y) + (s3 * point1.y) - ((s2 * point1.y) + (s3 * point2.y) + (s1 * point3.y))
    let m13 = (s1 * point2.x) + (s2 * point3.x) + (s3 * point1.x) - ((s2 * point1.x) + (s3 * point2.x) + (s1 * point3.x))

    let x = 0.5 * m12 / m11
    let y = -0.5 * m13 / m11
    let radius = pow(pow(point1.x - x, 2) + (pow(point1.y - y, 2)), 0.5)

    return (CGPoint(x: x, y: y), radius)
}
