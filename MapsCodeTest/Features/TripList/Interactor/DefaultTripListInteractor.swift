import RxSwift

protocol TripListInteractorDelegate: class, AutoMockable {
  func didLoad(trips: [Trip])
  func didFailLoadingTrips(error: Error)
  func trip(annotations: [Annotation])
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
  
  func map(tripPoints: [TripStop], origin: TripPoint, destination: TripPoint) {
    let pointsToShow = map(tripPoints) + map(origin, destination: destination)
    delegate?.trip(annotations: pointsToShow)
  }
  
  private func map(_ tripPoints: [TripStop]) -> [Annotation] {
    let points = tripPoints.compactMap({ $0.point })
    let coordinates = points.compactMap({ $0.coordinates })
    return coordinates.map({ RoutePointAnnotation(coordinate: $0) })
  }
  
  private func map(_ origin: TripPoint, destination: TripPoint) -> [Annotation] {
    var edges = [RoutePointAnnotation]()
    guard let originCoordinate = origin.coordinates else { return edges }
    edges.append(RoutePointAnnotation(coordinate: originCoordinate))
    guard let destinationCoordinate = destination.coordinates else { return edges }
    edges.append(RoutePointAnnotation(coordinate: destinationCoordinate))
    return edges
  }
}
