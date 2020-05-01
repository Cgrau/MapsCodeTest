import UIKit

class DefaultFormPresenter: FormPresenter {
  
  weak var ui: FormUI?
  private let interactor: FormInteractor
  private let navigator: FormNavigator
  
  init(interactor: FormInteractor,
       navigator: FormNavigator) {
    self.interactor = interactor
    self.navigator = navigator
  }
  
  func didLoad() {
    interactor.getTimeAndDate()
  }
  
  func closeButtonAction() {
    navigator.dismiss()
  }
  
  func sendButtonAction() {
    
  }
}

extension DefaultFormPresenter: FormInteractorDelegate {
  func didLoad(time: String, date: String) {
    
  }
  
  func didSendData() {
    
  }
  
  func didFailSendingData() {
    
  }
}
