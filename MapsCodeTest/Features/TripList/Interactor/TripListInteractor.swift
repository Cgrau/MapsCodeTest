import UIKit

protocol TripListInteractor: class, AutoMockable {
  var delegate: TripListInteractorDelegate? { get set }
  
  func getTrips()
  func map(tripPoints: [TripStop],
           origin: TripPoint,
           destination: TripPoint,
           annotationDelegate: AnnotationDelegate)
}
