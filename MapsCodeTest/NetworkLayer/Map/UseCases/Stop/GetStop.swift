import RxSwift

struct GetStop: GetStopUseCase {

  private let repository: MapRepository
  
  init(repository: MapRepository) {
    self.repository = repository
  }
  
  func execute(request: StopRequest) -> Single<Stop> {
    return repository.getStop(request: request)
  }
}
