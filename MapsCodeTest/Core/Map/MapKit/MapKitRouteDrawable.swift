import MapKit

private enum Constants {
  static let paddingMultiplier = 0.25
  static let paddingDivider = 2.0
}

final class MapKitRouteDrawable: RouteDrawable {

  private var currentRoute: MKPolyline?
  private weak var mapProvider: MapProvider?
  
  private var mapView: MKMapView? {
    return mapProvider?.mapView as? MKMapView
  }
  
  init(mapProvider: MapProvider) {
    self.mapProvider = mapProvider
  }
  
  func draw(route polyLineString: String?)  {
    removeRoute()
    guard let polyLineString = polyLineString else { return }
    let polyline = Polyline(encodedPolyline: polyLineString)
    guard let route = polyline.mkPolyline else { return }
    let mkPolyline = MKPolyline(coordinates: route.coordinates, count: route.pointCount)
    self.currentRoute = mkPolyline
    self.mapView?.addOverlay(mkPolyline, level: .aboveLabels)
    self.center(routePolyline: mkPolyline)
  }
  
  func removeRoute() {
    if let currentRoute = currentRoute {
      mapView?.removeOverlay(currentRoute)
    }
  }
  
  private func center(routePolyline: MKPolyline) {
    var regionRect = routePolyline.boundingMapRect
    
    let wPadding = regionRect.size.width * Constants.paddingMultiplier
    let hPadding = regionRect.size.height * Constants.paddingMultiplier

    //Add padding to the region
    regionRect.size.width += wPadding
    regionRect.size.height += hPadding

    //Center the region on the line
    regionRect.origin.x -= wPadding / Constants.paddingDivider
    regionRect.origin.y -= hPadding / Constants.paddingDivider
    
    self.mapView?.setRegion(MKCoordinateRegion(regionRect), animated: true)
  }
}
