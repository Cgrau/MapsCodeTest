import MapKit

final class RoutePointAnnotation: NSObject, MapKitAnnotation {
  
  var coordinate: CLLocationCoordinate2D
  weak var delegate: AnnotationDelegate?
  
  init(latitude: Double, longitude: Double) {
    self.coordinate = CLLocationCoordinate2D(latitude: latitude,
                                             longitude: longitude)
    super.init()
  }
}
