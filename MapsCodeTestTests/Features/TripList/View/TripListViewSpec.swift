import SnapshotTesting
import CoreLocation
import XCTest
@testable import MapsCodeTest

class TripListViewSpec: XCTestCase {
  
  private var sut: TripListView!
  private var mapProvider: MapProviderMock!
  private var routeDrawable: RouteDrawableMock!
  private var annotationDrawable: AnnotationDrawableMock!
  
  override func setUp() {
    sut = tripListView()
    mapProvider = MapProviderMock()
    routeDrawable = RouteDrawableMock()
    annotationDrawable = AnnotationDrawableMock()
  }
  
  func test_list_view_init_state() {
    givenMapSetup()
    givenTrips()
    assertSnapshot(matching: sut, as: .image)
  }
  
  override func tearDown() {
    sut = nil
    mapProvider = nil
    routeDrawable = nil
    annotationDrawable = nil
  }
  
  func givenMapSetup() {
    mapProvider.underlyingMapView = UIView()
    sut.setupProviders(mapProvider: mapProvider,
                       routeDrawable: routeDrawable,
                       annotationDrawable: annotationDrawable)
  }
  
  func givenTrips() {
    sut.trips = [Trip](repeating: Trip.mock, count: 7)
  }
}

extension TripListViewSpec {
  private func tripListView() -> TripListView {
    return TripListView(frame: viewControllerFrame)
  }
}
