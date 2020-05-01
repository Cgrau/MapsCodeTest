import UIKit

class DefaultFormNavigator: FormNavigator {
  
  private let from: UIViewController
  
  init(from: UIViewController) {
    self.from = from
  }
  
  func dismiss() {
    from.dismiss(animated: true)
  }
}
