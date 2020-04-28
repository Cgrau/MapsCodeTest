import MapKit

final class StopPointAnnotation: NSObject, MapKitAnnotation {

  var coordinate: CLLocationCoordinate2D
  var id: Int
  weak var delegate: AnnotationDelegate?
  
  init(id: Int,
       coordinate: CLLocationCoordinate2D) {
    self.id = id
    self.coordinate = coordinate
    super.init()
  }
  
  func didSelect() {
    delegate?.annotationDidSelect(id: id, coordinate: coordinate)
  }
  
  func didDeselect() {
    delegate?.annotationDidDeselect()
  }
}
