import UIKit

protocol FormInteractorDelegate: class {
  func didLoad(time: String, date: String)
  func didSendData()
  func didFailSendingData()
}

class DefaultFormInteractor: FormInteractor {
  
  weak var delegate: FormInteractorDelegate?
  
  func getTimeAndDate() {
    delegate?.didLoad(time: "", date: "")
  }
  
  func sendDate() {
    
  }
}
