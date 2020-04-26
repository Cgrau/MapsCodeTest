import MapKit

private enum ViewLayout {
  static let polylineWidth: CGFloat = 5.0
  static let polygonLineWidth: CGFloat = 2.0
  static let fillAlpha: CGFloat = 0.3
}

extension MapKitProvider {
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let polyline = overlay as? MKPolyline {
      return renderer(for: polyline)
    } else if let polygon = overlay as? MKPolygon {
      return renderer(for: polygon)
    } else {
      return MKOverlayRenderer(overlay: overlay)
    }
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
  
  private func renderer(for polygon: MKPolygon) -> MKPolygonRenderer {
    let renderer = MKPolygonRenderer(overlay: polygon)
    renderer.strokeColor = .blue
    renderer.fillColor = UIColor.blue.withAlphaComponent(ViewLayout.fillAlpha)
    renderer.lineWidth = ViewLayout.polygonLineWidth
    return renderer
  }
}
