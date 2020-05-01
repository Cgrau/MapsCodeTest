import UIKit

protocol FormPresenter: class {
  var ui: FormUI? { get set }
  
  func didLoad()
  func closeButtonAction()
  func sendButtonAction()
}
