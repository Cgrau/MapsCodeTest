import RxSwift

protocol TripListInteractorDelegate: class, AutoMockable {
  func didLoad(trips: [Trip])
  func didFailLoadingTrips(error: Error)
  func trip(annotations: [Annotation])
}

class DefaultTripListInteractor: TripListInteractor {
  
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
  
  func map(tripPoints: [TripStop],
           origin: TripPoint,
           destination: TripPoint,
           annotationDelegate: AnnotationDelegate) {
    let pointsToShow = map(tripPoints, annotationDelegate: annotationDelegate) + map(origin, destination: destination)
    delegate?.trip(annotations: pointsToShow)
  }
  
  private func map(_ tripPoints: [TripStop],
                   annotationDelegate: AnnotationDelegate) -> [Annotation] {
    return tripPoints.compactMap({
      guard let id = $0.id,
        let latitude = $0.point?.latitude,
        let longitude = $0.point?.longitude else { return nil }
      let stopAnnotation = StopPointAnnotation(id: id,
                                               latitude: latitude,
                                               longitude: longitude)
      stopAnnotation.delegate = annotationDelegate
      return stopAnnotation
    })
  }
  
  private func map(_ origin: TripPoint,
                   destination: TripPoint) -> [Annotation] {
    var edges = [RoutePointAnnotation?]()
    edges.append(routePoint(from: origin))
    edges.append(routePoint(from: destination))
    return edges.compactMap({ $0 })
  }
  
  private func routePoint(from point: TripPoint) -> RoutePointAnnotation? {
    guard let longitude = point.longitude,
      let latitude = point.latitude else { return nil }
    return RoutePointAnnotation(latitude: latitude,
                                longitude: longitude)
  }
}
