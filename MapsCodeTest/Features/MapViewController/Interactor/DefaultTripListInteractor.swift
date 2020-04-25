import UIKit

protocol TripListInteractorDelegate: class {
  func tripsFetched()
}

class DefaultTripListInteractor: TripListInteractor{
  
  weak var delegate: TripListInteractorDelegate?
  
  func getTrips() {
    delegate?.tripsFetched()
  }
}
