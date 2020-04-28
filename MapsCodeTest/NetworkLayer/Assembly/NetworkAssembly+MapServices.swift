extension NetworkAssembly {
  public var getTrips: GetTripsUseCase {
    return GetTrips(repository: mapsRepository)
  }
  
  public var getStop: GetStopUseCase {
    return GetStop(repository: mapsRepository)
  }
  
  var mapsRepository: MapRepository {
    return MapRepository(apiDataSource: mapsDataSource)
  }
  
  private var mapsDataSource: MapDataSource {
    return MapsApiDataSource(provider: moya(),
                             errorAdapter: errorAdapter,
                             tripsApiToDomainMapper: TripsApiToDomainMapper(),
                             stopApiToDomainMapper: StopApiToDomainMapper())
  }
}
