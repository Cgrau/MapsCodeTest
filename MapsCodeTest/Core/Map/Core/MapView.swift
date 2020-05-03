import CoreLocation

protocol MapView: class, AutoMockable {
  
  func setupProviders(mapProvider: MapProvider,
                      routeDrawableProvider: RouteDrawable)
  func draw(route: Route)
  func removeRoute()
}

struct Route {
  let coordinates: [CLLocationCoordinate2D]
  let pointCount: Int
}
