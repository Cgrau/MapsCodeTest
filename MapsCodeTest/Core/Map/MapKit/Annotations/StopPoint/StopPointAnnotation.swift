import MapKit

final class StopPointAnnotation: NSObject, MapKitAnnotation {
  
  var id: Int
  var coordinate: CLLocationCoordinate2D
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
  
  func annotationView() -> UIView? {
    let view = MKMarkerAnnotationView()
    view.markerTintColor = .white
    view.displayPriority = .required
    return view
  }
  
  func selectedColor() -> UIColor {
    return .white
  }
  
  func deselectedColor() -> UIColor {
    return .white
  }
}
