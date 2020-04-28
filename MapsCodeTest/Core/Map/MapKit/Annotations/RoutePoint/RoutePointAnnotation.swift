import MapKit

final class RoutePointAnnotation: NSObject, MapKitAnnotation {
  
  var coordinate: CLLocationCoordinate2D
  var id: String?
  
  init(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
    super.init()
  }
}
