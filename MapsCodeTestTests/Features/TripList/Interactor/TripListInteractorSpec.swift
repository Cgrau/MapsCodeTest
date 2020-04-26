import XCTest
import RxSwift
@testable import MapsCodeTest

final class TripListInteractorSpec: XCTestCase {
  
  private var sut: DefaultTripListInteractor!
  private var getTripsUseCase: GetTripsUseCaseMock!
  private var delegate: TripListInteractorDelegateMock!
  
  override func setUp() {
    getTripsUseCase = GetTripsUseCaseMock()
    delegate = TripListInteractorDelegateMock()
    sut = DefaultTripListInteractor(getTripsUseCase: getTripsUseCase)
    sut.delegate = delegate
  }
  
  func test_get_trips_OK() {
    givenGetTripsResponse_OK()
    sut.getTrips()
    XCTAssertTrue(delegate.didLoadTripsCalled)
    XCTAssertFalse(delegate.didFailLoadingTripsErrorCalled)
  }
  
  func test_get_trips_KO() {
    givenGetTripsResponse_KO()
    sut.getTrips()
    XCTAssertFalse(delegate.didLoadTripsCalled)
    XCTAssertTrue(delegate.didFailLoadingTripsErrorCalled)
  }
}

extension TripListInteractorSpec {
  func givenGetTripsResponse_OK() {
    getTripsUseCase.executeReturnValue = Single.create(subscribe: { event in
      event(.success([Trip](repeating: Trip.mock, count: 10)))
      return Disposables.create()
    })
  }

  func givenGetTripsResponse_KO() {
    getTripsUseCase.executeReturnValue = Single.create(subscribe: { event in
      event(.error(PlainError.mock))
      return Disposables.create()
    })
  }
}
