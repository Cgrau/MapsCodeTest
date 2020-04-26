import UIKit

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
    guard let route = trip.route, let driverName = trip.driverName, let description = trip.description else {
      ui?.show(error: Constants.incompleteTrip)
      return
    }
    ui?.show(route: route,
             driverName: driverName,
             description: description)
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
}
