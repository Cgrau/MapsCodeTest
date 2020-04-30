import SnapshotTesting
import CoreLocation
import XCTest
@testable import MapsCodeTest

class TripListViewSpec: XCTestCase {
  
  private var sut: TripListView!
  private var mapProvider: MapProviderMock!
  private var routeDrawable: RouteDrawableMock!
  private var annotationDrawable: AnnotationDrawableMock!
  private var alertProvider: StopInfoAlertProviderMock!
  
  override func setUp() {
    sut = tripListView()
    mapProvider = MapProviderMock()
    routeDrawable = RouteDrawableMock()
    annotationDrawable = AnnotationDrawableMock()
    alertProvider = StopInfoAlertProviderMock()
    givenMapSetup()
    givenTrips()
  }
  
  func test_list_view_init_state() {
    assertSnapshot(matching: sut, as: .image)
  }
  
  func test_list_view_info_view() {
    sut.display(driverName: "John Doe", description: ":)")
    assertSnapshot(matching: sut, as: .image)
  }
  
  override func tearDown() {
    sut = nil
    mapProvider = nil
    routeDrawable = nil
    annotationDrawable = nil
    alertProvider = nil
  }
  
  func givenMapSetup() {
    mapProvider.underlyingMapView = UIView()
    sut.setupProviders(mapProvider: mapProvider,
                       routeDrawable: routeDrawable,
                       annotationDrawable: annotationDrawable,
                       alertProvider: alertProvider)
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
