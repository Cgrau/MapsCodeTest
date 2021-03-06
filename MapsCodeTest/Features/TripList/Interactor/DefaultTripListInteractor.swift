import RxSwift

protocol TripListInteractorDelegate: class, AutoMockable {
  func didLoad(trips: [Trip])
  func didFailLoadingTrips(error: Error)
  func didLoad(stop: Stop)
  func didFailLoadingStop(error: Error)
  func trip(annotations: [Annotation])
}

class DefaultTripListInteractor: TripListInteractor {
  
  weak var delegate: TripListInteractorDelegate?
  
  private let getTripsUseCase: GetTripsUseCase
  private let getStopUseCase: GetStopUseCase
  private let bag = DisposeBag()
  
  init(getTripsUseCase: GetTripsUseCase,
       getStopUseCase: GetStopUseCase) {
    self.getTripsUseCase = getTripsUseCase
    self.getStopUseCase = getStopUseCase
  }
  
  func getTrips() {
    getTripsUseCase.execute().subscribe(onSuccess: { [weak self] trips in
      self?.delegate?.didLoad(trips: trips)
    }) { [weak self] error in
      self?.delegate?.didFailLoadingTrips(error: error)
    }.disposed(by: bag)
  }
  
  func getStop(stopID: Int) {
    getStopUseCase.execute(request: StopRequest(id: stopID)).subscribe(onSuccess: { [weak self] stop in
      self?.delegate?.didLoad(stop: stop)
    }) { [weak self] error in
      self?.delegate?.didFailLoadingStop(error: error)
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
    edges.append(routePoint(from: origin, routePointType: .start))
    edges.append(routePoint(from: destination, routePointType: .end))
    return edges.compactMap({ $0 })
  }
  
  private func routePoint(from point: TripPoint,
                          routePointType: RoutePointType) -> RoutePointAnnotation? {
    guard let longitude = point.longitude,
      let latitude = point.latitude else { return nil }
    return RoutePointAnnotation(latitude: latitude,
                                longitude: longitude,
                                routePointType: routePointType)
  }
}
