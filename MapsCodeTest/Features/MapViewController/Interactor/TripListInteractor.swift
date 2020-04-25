import UIKit

protocol TripListInteractor: class{
  var delegate: TripListInteractorDelegate? { get set }
  
  func getTrips()
}
