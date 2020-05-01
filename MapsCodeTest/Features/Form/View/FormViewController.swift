import UIKit

class FormViewController: UIViewController, FormUI {
  
  var mainView: FormView?
  
  var presenter: FormPresenter?
  
  override func loadView() {
    mainView?.delegate = self
    view = mainView
  }
  
  override func viewDidLoad() {
    presenter?.didLoad()
  }
  
  func showLoading() {
    showLoadingView()
  }
  
  func hideLoading() {
    hideLoadingView()
  }
  
  func display(time: String, date: String) {
    mainView?.display(time: time, date: date)
  }
  
  func showSuccess(message: String, completion: (() -> Void)?) {
    show(message: message,
         completion: completion)
  }
  
  func showError(message: String) {
    show(errorMessage: message)
  }
}

extension FormViewController: FormViewDelegate {
  
  func didTapCloseButton() {
    presenter?.closeButtonAction()
  }
  
  func didTapSaveButton(fullName: String?,
                        email: String?,
                        phoneNumber: String?,
                        date: String?,
                        time: String?,
                        comment: String?) {
    presenter?.saveButtonAction(fullName: fullName,
                                email: email,
                                phoneNumber: phoneNumber,
                                date: date,
                                time: time,
                                comment: comment)
  }
}
