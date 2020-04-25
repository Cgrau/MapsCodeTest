import MapKit
final class MapKitProvider: NSObject, MapProvider, MKMapViewDelegate {
  
  lazy var mapView: UIView = {
    let view = MKMapView()
    view.showsCompass = false
    view.isRotateEnabled = false
    view.mapType = .mutedStandard
    return view
  }()
  
  override init() {
    super.init()
    showUserLocation()
  }

  private func showUserLocation() {
    guard let mapView = mapView as? MKMapView else { fatalError() }
    mapView.userLocation.title = ""
    mapView.showsUserLocation = true
  }
}

extension MapKitProvider {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    return touch.view is MKAnnotationView == false
  }
}
