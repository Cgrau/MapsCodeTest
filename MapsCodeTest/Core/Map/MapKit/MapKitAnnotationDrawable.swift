import MapKit

final class MapKitAnnotationDrawable: AnnotationDrawable {
  
  private weak var mapProvider: MapProvider?
  
  private var mapView: MKMapView? {
    return mapProvider?.mapView as? MKMapView
  }
  
  init(mapProvider: MapProvider) {
    self.mapProvider = mapProvider
  }
  
  func add(annotations: [Annotation]) {
    removeAnnotations()
    guard let mapKitAnnotations = annotations as? [MapKitAnnotation] else { return }
    self.mapView?.addAnnotations(mapKitAnnotations)
  }
  
  func removeAnnotations() {
    guard let mapView = self.mapView else { return }
    mapView.removeAnnotations(mapView.annotations)
  }
}
