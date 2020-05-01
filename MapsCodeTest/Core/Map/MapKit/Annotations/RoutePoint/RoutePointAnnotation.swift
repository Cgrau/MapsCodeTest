import MapKit

public enum RoutePointType {
  case start
  case end
  
  func pinColor() -> UIColor {
    switch self {
    case .start:
      return UIColor(hex: 0x60BD12)
    case .end:
      return UIColor(hex: 0xC10E0E)
    }
  }
}

final class RoutePointAnnotation: NSObject, MapKitAnnotation {
  
  var coordinate: CLLocationCoordinate2D
  weak var delegate: AnnotationDelegate?
  private let routePointType: RoutePointType
  
  init(latitude: Double,
       longitude: Double,
       routePointType: RoutePointType) {
    self.coordinate = CLLocationCoordinate2D(latitude: latitude,
                                             longitude: longitude)
    self.routePointType = routePointType
    super.init()
  }
  
  func annotationView() -> UIView? {
    let view = MKMarkerAnnotationView()
    view.markerTintColor = routePointType.pinColor()
    view.displayPriority = .required
    return view
  }
  
  func selectedColor() -> UIColor {
    return routePointType.pinColor()
  }
  
  func deselectedColor() -> UIColor {
    return routePointType.pinColor()
  }
}
