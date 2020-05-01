import MapKit

private enum ViewLayout {
  static let polylineWidth: CGFloat = 5.0
  static let polygonLineWidth: CGFloat = 2.0
  static let fillAlpha: CGFloat = 0.3
}

extension MapKitProvider {
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    guard let polyline = overlay as? MKPolyline else {
      return MKOverlayRenderer(overlay: overlay)
    }
    return renderer(for: polyline)
  }
  
  private func renderer(for tileOverlay: MKTileOverlay) -> MKTileOverlayRenderer {
    return MKTileOverlayRenderer(tileOverlay: tileOverlay)
  }
  
  private func renderer(for polyline: MKPolyline) -> MKPolylineRenderer {
    let renderer = MKPolylineRenderer(overlay: polyline)
    renderer.strokeColor = .blue
    renderer.lineWidth = ViewLayout.polylineWidth
    return renderer
  }
}
