import CoreLocation

protocol MapView: class, AutoMockable {
  
  func setupProviders(mapProvider: MapProvider,
                      routeDrawableProvider: RouteDrawable)
  func draw(route: Route)
  func removeRoute()
}
