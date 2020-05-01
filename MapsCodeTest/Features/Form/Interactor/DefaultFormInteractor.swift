import UIKit

protocol FormInteractorDelegate: class {
  func didLoad(time: String, date: String)
  func didSendData()
  func didFailSendingData()
}

class DefaultFormInteractor: FormInteractor {
  
  weak var delegate: FormInteractorDelegate?
  private let localStorage: LocalStorage
  
  init(localStorage: LocalStorage) {
    self.localStorage = localStorage
  }
  
  func getTimeAndDate() {
    delegate?.didLoad(time: "", date: "")
  }
  
  func save(data: FormInfo) {
    localStorage.store(string: data.fullName, forKey: .fullName)
    localStorage.store(string: data.email, forKey: .email)
    localStorage.store(string: data.phoneNumber, forKey: .phone)
    localStorage.store(string: data.date, forKey: .date)
    localStorage.store(string: data.time, forKey: .time)
  }
}
