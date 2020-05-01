import XCTest
import CoreLocation
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
    XCTAssertTrue(interactor.mapTripPointsOriginDestinationAnnotationDelegateCalled)
    XCTAssertFalse(ui.showErrorCalled)
  }
  
  func test_select_trip_KO() {
    sut.select(trip: Trip.incompleteTrip)
    XCTAssertFalse(ui.showRouteDriverNameDescriptionCalled)
    XCTAssertFalse(interactor.mapTripPointsOriginDestinationAnnotationDelegateCalled)
    XCTAssertTrue(ui.showErrorCalled)
  }
  
  func test_didTapContactButton() {
    sut.didTapContactButton()
    XCTAssertTrue(navigator.navigateToContactFormCalled)
  }
  
  // MARK: TripListInteractorDelegate
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
  
  func test_trip_annotations() {
    sut.trip(annotations: [RoutePointAnnotation](repeating: RoutePointAnnotation.mock, count: 4))
    XCTAssertTrue(ui.addPointsCalled)
  }
  
  func test_did_load_stop() {
    sut.didLoad(stop: Stop.mock)
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showStopInfoUserNameAddressPriceStopTimePaidCalled)
  }
  
  func test_did_fail_loading_stop_error() {
    sut.didFailLoadingStop(error: PlainError.mock)
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showErrorCalled)
  }
  
  func test_annotation_didSelect_id_coordinate() {
    sut.annotationDidSelect(id: 1,
                            coordinate: CLLocationCoordinate2D.mock)
    XCTAssertTrue(ui.showLoadingCalled)
    XCTAssertTrue(interactor.getStopStopIDCalled)
  }
  
  func test_annotation_didDeselect() {
    sut.annotationDidDeselect()
    XCTAssertTrue(ui.removeStopInfoCalled)
  }
}
