import UIKit

protocol StopInfoAlertProvider: AutoMockable {
  var viewDelegate: AlertViewDelegate? { get set }
  func showAlert(userName: String,
                 address: String,
                 price: Double,
                 stopTime: String,
                 paid: Bool)
  func removeStopInfo()
}

protocol AlertViewDelegate: class, AutoMockable {
  func willShow(alert: UIView)
  func willRemove(alert: UIView)
}
