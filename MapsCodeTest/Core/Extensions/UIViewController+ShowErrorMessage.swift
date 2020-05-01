import UIKit

private enum MessageType: String {
  case message = "MapsCodeTest"
  case error = "MapsCodeTest - Error"
}

extension UIViewController {
  func show(errorMessage: String) {
    showAlert(with: errorMessage, type: .error)
  }
  
  func show(message: String) {
    showAlert(with: message, type: .message)
  }
  
  private func showAlert(with message: String, type: MessageType) {
    let alert = UIAlertController(title: type.rawValue,
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "👍🏼",
                                  style: UIAlertAction.Style.default,
                                  handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}
