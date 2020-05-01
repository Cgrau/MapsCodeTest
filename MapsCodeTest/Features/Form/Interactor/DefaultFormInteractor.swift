import UIKit

protocol FormInteractorDelegate: class, AutoMockable {
  func didLoad(time: String, date: String)
  func didFailLoadingDateAndTime(message: String)
  func didSaveData(message: String)
  func didFailSavingData(error: String)
  func display(counter: Int)
}

private enum Constants {
  static let saveSuccess = "Data saved successfully"
  static let mandatoryError = "All Fields are mandatory but phone number"
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
    guard let fullName = data.fullName, fullName != "",
      let email = data.email, email != "",
      let jsonString = data.toJsonString()  else {
        delegate?.didFailSavingData(error: Constants.mandatoryError)
        return
    }
    localStorage.store(value: jsonString)
    delegate?.didSaveData(message: Constants.saveSuccess)
    delegate?.display(counter: localStorage.getSavedItemsCount())
  }
}
