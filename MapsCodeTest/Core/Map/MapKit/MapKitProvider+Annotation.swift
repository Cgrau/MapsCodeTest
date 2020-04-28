import MapKit

extension MapKitProvider {
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    guard let annotation = view.annotation as? MapKitAnnotation else { return }
    annotation.didSelect()
  }
  
  func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    guard let annotation = view.annotation as? MapKitAnnotation else { return }
    annotation.didDeselect()
  }
}
