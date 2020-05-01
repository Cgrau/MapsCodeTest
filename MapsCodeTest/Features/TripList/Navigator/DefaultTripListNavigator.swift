import UIKit

class DefaultTripListNavigator: TripListNavigator {
  
  private let from: UIViewController
  private let formProvider: FormProvider
  
  init(from: UIViewController,
       formProvider: FormProvider) {
    self.from = from
    self.formProvider = formProvider
  }
  
  func navigateToContactForm() {
    let viewController = formProvider.formViewController()
    from.present(viewController, animated: true)
  }
}
