import MapKit

final class RoutePointAnnotation: NSObject, MapKitAnnotation {
  
  var coordinate: CLLocationCoordinate2D
  weak var delegate: AnnotationDelegate?
  
  init(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
    super.init()
  }
}
