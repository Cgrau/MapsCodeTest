import UIKit

protocol StopInfoAlertProvider: AutoMockable {
  var viewDelegate: AlertViewDelegate? { get set }
  func show(stopInfo: Stop)
  func removeStopInfo()
}

protocol AlertViewDelegate: class, AutoMockable {
  func willShow(alert: UIView)
  func willRemove(alert: UIView)
}
