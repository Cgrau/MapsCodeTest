import RxSwift

protocol MapDataSource {
  func getTrips() -> Single<[Trip]>
}
