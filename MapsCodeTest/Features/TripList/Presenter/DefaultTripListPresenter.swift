import UIKit

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
