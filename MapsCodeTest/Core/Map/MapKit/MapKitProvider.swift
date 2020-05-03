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
    guard let mapView = mapView as? MKMapView else { fatalError("MapKitProvider - init") }
    mapView.delegate = self
    showUserLocation()
  }

  private func showUserLocation() {
    guard let mapView = mapView as? MKMapView else { fatalError("MapKitProvider - showUserLocation") }
    mapView.userLocation.title = ""
    mapView.showsUserLocation = true
  }
}
