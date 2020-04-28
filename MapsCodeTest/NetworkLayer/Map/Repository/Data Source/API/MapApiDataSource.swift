import RxSwift
import Moya

struct MapsApiDataSource: MapDataSource {
  
  private let provider: MoyaProvider<MapService>
  private let errorAdapter: ErrorAdapter
  private let tripsApiToDomainMapper: TripsApiToDomainMapper
  private let stopApiToDomainMapper: StopApiToDomainMapper
  
  init(provider: MoyaProvider<MapService>,
       errorAdapter: ErrorAdapter,
       tripsApiToDomainMapper: TripsApiToDomainMapper,
       stopApiToDomainMapper: StopApiToDomainMapper) {
    self.provider = provider
    self.errorAdapter = errorAdapter
    self.tripsApiToDomainMapper = tripsApiToDomainMapper
    self.stopApiToDomainMapper = stopApiToDomainMapper
  }
  
  func getTrips() -> Single<[Trip]> {
    return provider.rx
      .request(.trips)
      .filterSuccessfulStatusCodes()
      .mapOrError(TripsApiResponse.self, errorAdapter.make)
      .map(tripsApiToDomainMapper.map)
  }
  
  func getStop(request: StopRequest) -> Single<Stop> {
    return provider.rx
    .request(.stop(request))
    .filterSuccessfulStatusCodes()
    .mapOrError(StopApiResponse.self, errorAdapter.make)
    .map(stopApiToDomainMapper.map)
  }
}
