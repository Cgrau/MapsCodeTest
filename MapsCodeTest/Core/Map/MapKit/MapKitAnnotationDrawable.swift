import MapKit

final class MapKitAnnotationDrawable: AnnotationDrawable {
  
  private var currentRoute: MKPolyline?
  private weak var mapProvider: MapProvider?
  
  private var mapView: MKMapView? {
    return mapProvider?.mapView as? MKMapView
  }
  
  init(mapProvider: MapProvider) {
    self.mapProvider = mapProvider
  }
  
  func add(annotations: [Annotation]) {
    removeAnnotations()
    annotations.forEach({
      let annotation = MKPointAnnotation()
      annotation.coordinate = $0.coordinate
      self.mapView?.addAnnotation(annotation)
    })
  }
  
  func removeAnnotations() {
    guard let mapView = self.mapView else { return }
    mapView.removeAnnotations(mapView.annotations)
  }
}
