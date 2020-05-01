import UIKit

class FormViewController: UIViewController, FormUI {
  
  var mainView: FormView?
  
  var presenter: FormPresenter?
  
  override func loadView() {
    mainView?.delegate = self
    view = mainView
  }
  
  func showSomething() {
    
  }
}

extension FormViewController: FormViewDelegate {
  
  func didTapCloseButton() {
    presenter?.closeButtonAction()
  }
  
  func didTapSendButton() {
    
  }
}
