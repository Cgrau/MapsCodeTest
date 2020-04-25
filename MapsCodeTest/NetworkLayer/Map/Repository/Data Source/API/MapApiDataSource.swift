import RxSwift
import Moya

struct MapsApiDataSource: MapDataSource {
  
  private let provider: MoyaProvider<MapService>
  private let errorAdapter: ErrorAdapter
  private let tripsApiToDomainMapper: TripsApiToDomainMapper
  
  init(provider: MoyaProvider<MapService>,
       errorAdapter: ErrorAdapter,
       tripsApiToDomainMapper: TripsApiToDomainMapper) {
    self.provider = provider
    self.errorAdapter = errorAdapter
    self.tripsApiToDomainMapper = tripsApiToDomainMapper
  }
  
  func getTrips() -> Single<[Trip]> {
    return provider.rx
      .request(.trips)
      .filterSuccessfulStatusCodes()
      .mapOrError(TripsApiResponse.self, errorAdapter.make)
      .map(tripsApiToDomainMapper.map)
  }
}
