import MapKit

protocol MapKitAnnotation: MKAnnotation, Annotation {}

extension MapKitAnnotation {
  func didSelect() {}
  func didDeselect() {}
}
