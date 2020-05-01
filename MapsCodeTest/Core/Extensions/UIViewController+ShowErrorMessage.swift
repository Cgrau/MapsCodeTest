import UIKit

private enum MessageType: String {
  case message = "MapsCodeTest"
  case error = "MapsCodeTest - Error"
}

extension UIViewController {
  func show(errorMessage: String) {
    showAlert(with: errorMessage, type: .error)
  }
  
  func show(message: String, completion: (() -> Void)? = nil) {
    showAlert(with: message, type: .message, completion: completion)
  }
  
  private func showAlert(with message: String, type: MessageType, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: type.rawValue,
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "👍🏼", style: .default, handler: { _ in
      completion?()
    }))
    self.present(alert, animated: true)
  }
}
