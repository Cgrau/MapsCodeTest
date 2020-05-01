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
  static let jsonError = "Unable to encode model"
  static let dateTimeError = "Unable to retrieve date and time"
  static let invalidFields = "Review the following fields:\n\n"
  
  enum FieldError {
    static let email = "Email\n"
    static let fullName = "Name and Surname\n"
    static let comment = "Report Description\n"
  }
}

class DefaultFormInteractor: FormInteractor {
  
  weak var delegate: FormInteractorDelegate?
  private let localStorage: LocalStorage
  private let timeAndDateProvider: TimeAndDateProvider
  private let emailValidator: FieldValidator
  
  init(localStorage: LocalStorage,
       timeAndDateProvider: TimeAndDateProvider,
       emailValidator: FieldValidator) {
    self.localStorage = localStorage
    self.timeAndDateProvider = timeAndDateProvider
    self.emailValidator = emailValidator
  }
  
  func getTimeAndDate() {
    guard let dateTime = timeAndDateProvider.currentTimeAndDate() else {
      delegate?.didFailLoadingDateAndTime(message: Constants.dateTimeError)
      return
    }
    delegate?.didLoad(time: dateTime.time, date: dateTime.date)
  }
  
  func save(data: FormInfo) {
    var errorMessage = ""
    validate(fullName: data.fullName, errorMessage: &errorMessage)
    validate(email: data.email, errorMessage: &errorMessage)
    validate(comment: data.comment, errorMessage: &errorMessage)
    guard errorMessage == "" else {
      delegate?.didFailSavingData(error: Constants.invalidFields + errorMessage)
      return
    }
    guard let jsonString = data.toJsonString() else {
      delegate?.didFailSavingData(error: Constants.jsonError)
      return
    }
    localStorage.store(value: jsonString)
    delegate?.didSaveData(message: Constants.saveSuccess)
    delegate?.display(counter: localStorage.getSavedItemsCount())
  }
  
  private func validate(email: String?, errorMessage: inout String) {
    guard let email = email, email != "", emailValidator.validate(field: email) else {
      errorMessage += Constants.FieldError.email
      return
    }
  }
  
  private func validate(fullName: String?, errorMessage: inout String) {
    guard let fullName = fullName, fullName != "" else {
      errorMessage += Constants.FieldError.fullName
      return
    }
  }
  
  private func validate(comment: String?, errorMessage: inout String) {
    guard let comment = comment, comment != "" else {
      errorMessage += Constants.FieldError.comment
      return
    }
  }
}
