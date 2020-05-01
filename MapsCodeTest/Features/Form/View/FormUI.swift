import UIKit

protocol FormUI: class, AutoMockable {
  func showLoading()
  func hideLoading()
  func display(time: String, date: String)
  func showSuccess(message: String, completion: (() -> Void)?)
  func showError(message: String)
}
