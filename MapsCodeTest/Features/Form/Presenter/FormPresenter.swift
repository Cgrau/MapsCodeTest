import UIKit

protocol FormPresenter: class, AutoMockable {
  var ui: FormUI? { get set }
  
  func didLoad()
  func closeButtonAction()
  func saveButtonAction(data: FormInfo)
}
