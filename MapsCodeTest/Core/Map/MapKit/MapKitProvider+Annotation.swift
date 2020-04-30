import MapKit

private enum Constants {
  static let selectedColor = UIColor.blue
  static let deselectedColor = UIColor(red: 10, green: 14, blue: 255, alpha: 1)
}

extension MapKitProvider {
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let view = MKMarkerAnnotationView()
    view.markerTintColor = Constants.deselectedColor
    view.displayPriority = .required
    return view
  }
  
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    guard let pinView = view as? MKMarkerAnnotationView else { return }
    pinView.markerTintColor = Constants.selectedColor
    guard let annotation = view.annotation as? MapKitAnnotation else { return }
    annotation.didSelect()
  }
  
  func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    guard let pinView = view as? MKMarkerAnnotationView else { return }
    pinView.markerTintColor = Constants.deselectedColor
    guard let annotation = view.annotation as? MapKitAnnotation else { return }
    annotation.didDeselect()
  }
}
