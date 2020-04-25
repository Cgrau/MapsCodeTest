import MapKit

protocol RouteDrawable: class, AutoMockable {
  func draw(route polyLineString: String)
  func removeRoute()
}

struct Route {
  let coordinates: [CLLocationCoordinate2D]
  let pointCount: Int
}
