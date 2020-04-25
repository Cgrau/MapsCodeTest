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
    interactor.getTrips()
  }
}

extension DefaultTripListPresenter: TripListInteractorDelegate {
  func didLoad(trips: [Trip]) {
    ui?.show(trips: trips)
  }
  
  func didFailLoaingTrips(error: Error) {
    
  }
}