import XCTest
@testable import MapsCodeTest

final class TripListPresenterSpec: XCTestCase {
  
  private var sut: DefaultTripListPresenter!
  private var ui: TripListUIMock!
  private var interactor: TripListInteractorMock!
  private var navigator: TripListNavigatorMock!
  
  override func setUp() {
    interactor = TripListInteractorMock()
    navigator = TripListNavigatorMock()
    ui = TripListUIMock()
    sut = DefaultTripListPresenter(interactor: interactor,
                                   navigator: navigator)
    sut.ui = ui
  }
  
  func test_did_load() {
    sut.didLoad()
    XCTAssertTrue(ui.showLoadingCalled)
    XCTAssertTrue(interactor.getTripsCalled)
  }
  
  func test_select_trip_OK() {
    sut.select(trip: Trip.mock)
    XCTAssertTrue(ui.showRouteDriverNameDescriptionCalled)
    XCTAssertFalse(ui.showErrorCalled)
  }
  
  func test_select_trip_KO() {
    sut.select(trip: Trip.incompleteTrip)
    XCTAssertFalse(ui.showRouteDriverNameDescriptionCalled)
    XCTAssertTrue(ui.showErrorCalled)
  }
  
  func test_did_load_trips() {
    sut.didLoad(trips: [Trip.mock])
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showTripsCalled)
  }
  
  func test_did_fail_loading_trips_error() {
    sut.didFailLoadingTrips(error: PlainError.mock)
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showErrorCalled)
  }
}
