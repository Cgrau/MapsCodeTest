import UIKit

protocol TripListUI: class, AutoMockable {
  func show(trips: [Trip])
  func show(error: String)
  func showLoading()
  func hideLoading()
}
