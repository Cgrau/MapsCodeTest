import RxSwift

struct GetTrips: GetTripsUseCase {

  private let repository: MapRepository
  
  init(repository: MapRepository) {
    self.repository = repository
  }
  
  func execute() -> Single<[Trip]> {
    return repository.getTrips()
  }
  
}
