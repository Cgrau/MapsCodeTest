import UIKit

extension UIViewController {
  func show(errorMessage: String) {
    let alert = UIAlertController(title: "MapsCodeTest - Error",
                                  message: errorMessage,
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "👍🏼",
                                  style: UIAlertAction.Style.default,
                                  handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}
