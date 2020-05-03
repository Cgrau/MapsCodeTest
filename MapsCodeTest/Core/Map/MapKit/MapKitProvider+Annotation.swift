import MapKit

extension MapKitProvider {
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard let mkAnnotation = annotation as? MapKitAnnotation,
      let view = mkAnnotation.annotationView as? MKAnnotationView else { return nil }
    return view
  }
  
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    guard let pinView = view as? MKMarkerAnnotationView else { return }
    guard let annotation = view.annotation as? MapKitAnnotation else { return }
    pinView.markerTintColor = annotation.selectedColor
    annotation.didSelect()
  }
  
  func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    guard let pinView = view as? MKMarkerAnnotationView else { return }
    guard let annotation = view.annotation as? MapKitAnnotation else { return }
    pinView.markerTintColor = annotation.deselectedColor
    annotation.didDeselect()
  }
}
