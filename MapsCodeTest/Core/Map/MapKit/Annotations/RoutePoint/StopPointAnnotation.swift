import MapKit

final class StopPointAnnotation: NSObject, MapKitAnnotation {

  var coordinate: CLLocationCoordinate2D
  var id: Int
  weak var delegate: AnnotationDelegate?
  
  init(id: Int,
       latitude: Double,
       longitude: Double) {
    self.id = id
    self.coordinate = CLLocationCoordinate2D(latitude: latitude,
                                             longitude: longitude)
    super.init()
  }
  
  func didSelect() {
    delegate?.annotationDidSelect(id: id, coordinate: coordinate)
  }
  
  func didDeselect() {
    delegate?.annotationDidDeselect()
  }
}
