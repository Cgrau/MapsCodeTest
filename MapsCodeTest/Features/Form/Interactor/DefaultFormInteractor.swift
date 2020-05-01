import UIKit

protocol FormInteractorDelegate: class, AutoMockable {
  func didLoad(time: String, date: String)
  func didFailLoadingDateAndTime(message: String)
  func didSaveData(message: String)
  func didFailSavingData(error: String)
}

private enum Constants {
  static let saveSuccess = "Data saved successfully"
  static let phoneError = "Phone Number in mandatory"
  static let dateTimeError = "Unable to retrieve date and time"
}

class DefaultFormInteractor: FormInteractor {
  
  weak var delegate: FormInteractorDelegate?
  private let localStorage: LocalStorage
  private let timeAndDateProvider: TimeAndDateProvider
  
  init(localStorage: LocalStorage,
       timeAndDateProvider: TimeAndDateProvider) {
    self.localStorage = localStorage
    self.timeAndDateProvider = timeAndDateProvider
  }
  
  func getTimeAndDate() {
    guard let dateTime = timeAndDateProvider.currentTimeAndDate() else {
      delegate?.didFailLoadingDateAndTime(message: Constants.dateTimeError)
      return
    }
    delegate?.didLoad(time: dateTime.time, date: dateTime.date)
  }
  
  func save(data: FormInfo) {
    guard let phoneNumber = data.phoneNumber, phoneNumber != "" else {
      delegate?.didFailSavingData(error: Constants.phoneError)
      return
    }
    localStorage.store(string: data.fullName ?? "-", forKey: .fullName)
    localStorage.store(string: data.email ?? "-", forKey: .email)
    localStorage.store(string: phoneNumber, forKey: .phone)
    localStorage.store(string: data.date ?? "-", forKey: .date)
    localStorage.store(string: data.time ?? "-", forKey: .time)
    delegate?.didSaveData(message: Constants.saveSuccess)
  }
}
