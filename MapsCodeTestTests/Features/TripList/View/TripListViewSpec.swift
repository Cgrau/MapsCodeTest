import SnapshotTesting
import XCTest
@testable import MapsCodeTest

class TripListViewSpec: XCTestCase {
  
  private var sut: TripListView!
  private var mapProvider: MapProviderMock!
  private var routeDrawable: RouteDrawableMock!
  
  override func setUp() {
    sut = tripListView()
    mapProvider = MapProviderMock()
    routeDrawable = RouteDrawableMock()
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
  }
  
  func givenMapSetup() {
    mapProvider.underlyingMapView = UIView()
    sut.setupProviders(mapProvider: mapProvider,
                       routeDrawable: routeDrawable)
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

extension Trip {
  static var mock: Trip {
    return Trip(description: "Description",
                driverName: "John Doe",
                route: "Route",
                status: .ongoing,
                origin: nil,
                stops: nil,
                destination: nil,
                startTime: "12:00",
                endTime: "13:00")
  }
}
