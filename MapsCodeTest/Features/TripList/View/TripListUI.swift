import UIKit

protocol TripListUI: class, AutoMockable {
  func show(trips: [Trip])
  func show(error: String)
  func showLoading()
  func hideLoading()
  func show(route: String,
            driverName: String,
            description: String)
  func add(points: [Annotation])
  func showStopInfo(userName: String,
                    address: String,
                    price: Double,
                    stopTime: String,
                    paid: Bool)
  func removeStopInfo()
}
