import XCTest
import RxBlocking
import OHHTTPStubs
@testable import MapsCodeTest

class MapsSpec: XCTestCase {
  
  private var sut: MapRepository!
  
  override func setUp() {
    super.setUp()
    sut = resolver.mapsRepository
  }
  
  override func tearDown() {
    sut = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func test_get_trips() {
    givenThoseTrips()
    XCTAssertNoThrow(try sut.getTrips().toBlocking().single())
  }
  
  func test_get_stop() {
    givenThisStop()
    XCTAssertNoThrow(try sut.getStop(request: StopRequest.mock).toBlocking().single())
  }
}

extension MapsSpec {
  private func givenThoseTrips() {
    stub(condition: pathMatches("/trips")) { _ in
      return HTTPStubsResponse(jsonObject: Fixture.load("Trips.ok"),
                                 statusCode: 200,
                                 headers: nil
      )
    }
  }
  
  private func givenThisStop() {
    stub(condition: pathMatches("/stops/.*")) { _ in
      return HTTPStubsResponse(jsonObject: Fixture.load("Stop.ok"),
                                 statusCode: 200,
                                 headers: nil
      )
    }
  }
}

extension StopRequest {
  static var mock: StopRequest {
    return StopRequest(id: 1)
  }
}
