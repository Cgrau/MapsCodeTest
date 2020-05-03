import MapKit

protocol RouteDrawable: class, AutoMockable {
  func draw(route polyLineString: String?)
  func removeRoute()
}
