import UIKit
import CoreLocation

private enum Constants {
  static let incompleteTrip = "Incomplete Info on the selected trip"
}

class DefaultTripListPresenter: TripListPresenter {
  
  weak var ui: TripListUI?
  private let  interactor: TripListInteractor
  private let  navigator: TripListNavigator
  
  init(interactor: TripListInteractor,
       navigator: TripListNavigator) {
    self.interactor = interactor
    self.navigator = navigator
  }
  
  func didLoad() {
    ui?.showLoading()
    interactor.getTrips()
  }
  
  func select(trip: Trip) {
    guard let route = trip.route,
      let driverName = trip.driverName,
      let description = trip.description,
      let tripPoints = trip.stops,
      let originPoint = trip.origin?.point,
      let destinationPoint = trip.destination?.point else {
      ui?.show(error: Constants.incompleteTrip)
      return
    }
    ui?.show(route: route,
             driverName: driverName,
             description: description)
    interactor.map(tripPoints: tripPoints,
                   origin: originPoint,
                   destination: destinationPoint,
                   annotationDelegate: self)
  }
}

extension DefaultTripListPresenter: TripListInteractorDelegate {
  func didLoad(trips: [Trip]) {
    ui?.hideLoading()
    ui?.show(trips: trips)
  }
  
  func didFailLoadingTrips(error: Error) {
    ui?.hideLoading()
    ui?.show(error: error.message)
  }
  
  func trip(annotations: [Annotation]) {
    ui?.add(points: annotations)
  }
}

extension DefaultTripListPresenter: AnnotationDelegate {
  func annotationDidSelect(id: Int, coordinate: CLLocationCoordinate2D) {
    //Show Stop Info
  }
  
  func annotationDidDeselect() {
    //Dismiss Stop Info
  }
}
