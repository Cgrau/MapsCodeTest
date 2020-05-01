import UIKit

protocol FormInteractorDelegate: class {
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
  
  init(localStorage: LocalStorage) {
    self.localStorage = localStorage
  }
  
  func getTimeAndDate() {
    guard let dateTime = getTimeAndDate() else {
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
  
  private func getTimeAndDate() -> (time: String, date: String)? {
    let date = Date()
    let calender = Calendar.current
    let components = calender.dateComponents([.year, .month, .day, .hour, .minute], from: date)
    guard let day = components.day, let month = components.month, let year = components.year, let hour = components.hour, let minute = components.minute else {
      return nil
    }
    let dateString = "\(day)/\(month)/\(year)"
    let timeString = "\(hour):\(minute)"
    return (timeString, dateString)
  }
}
