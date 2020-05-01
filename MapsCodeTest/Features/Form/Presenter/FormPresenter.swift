import UIKit

protocol FormPresenter: class {
  var ui: FormUI? { get set }
  
  func didLoad()
  func closeButtonAction()
  func saveButtonAction(fullName: String?,
                        email: String?,
                        phoneNumber: String?,
                        date: String?,
                        time: String?)
}
