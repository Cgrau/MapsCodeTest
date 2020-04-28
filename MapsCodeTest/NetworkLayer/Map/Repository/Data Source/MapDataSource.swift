import RxSwift

protocol MapDataSource {
  func getTrips() -> Single<[Trip]>
  func getStop(request: StopRequest) -> Single<Stop>
}
