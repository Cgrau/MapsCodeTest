import RxSwift

protocol TripListInteractorDelegate: class, AutoMockable {
  func didLoad(trips: [Trip])
  func didFailLoadingTrips(error: Error)
}

class DefaultTripListInteractor: TripListInteractor{
  
  weak var delegate: TripListInteractorDelegate?
  
  private let getTripsUseCase: GetTripsUseCase
  private let bag = DisposeBag()
  
  init(getTripsUseCase: GetTripsUseCase) {
    self.getTripsUseCase = getTripsUseCase
  }
  
  func getTrips() {
    getTripsUseCase.execute().subscribe(onSuccess: { [weak self] trips in
      self?.delegate?.didLoad(trips: trips)
    }) { [weak self] error in
      self?.delegate?.didFailLoadingTrips(error: error)
    }.disposed(by: bag)
  }
}
