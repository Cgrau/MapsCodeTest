import UIKit

protocol TripListUI: class, AutoMockable {
  func show(trips: [Trip])
  func show(errorMessage: String)
}
