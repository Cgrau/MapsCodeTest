import UIKit

protocol TripListInteractor: class, AutoMockable {
  var delegate: TripListInteractorDelegate? { get set }
  
  func getTrips()
}
