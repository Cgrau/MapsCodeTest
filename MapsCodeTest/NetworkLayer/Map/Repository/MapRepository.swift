import RxSwift

struct MapRepository {
  private let apiDataSource: MapDataSource
  
  init(apiDataSource: MapDataSource) {
    self.apiDataSource = apiDataSource
  }
  
  func getTrips() -> Single<[Trip]> {
    apiDataSource.getTrips()
  }
}
