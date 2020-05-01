import UIKit

protocol FormUI: class {
  func display(time: String, date: String)
  func showSuccess(message: String)
  func showError(message: String)
}
