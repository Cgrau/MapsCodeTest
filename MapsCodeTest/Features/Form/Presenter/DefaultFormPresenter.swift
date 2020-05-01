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
    ui?.showLoading()
    interactor.getTimeAndDate()
  }
  
  func closeButtonAction() {
    navigator.dismiss()
  }
  
  func saveButtonAction(fullName: String?,
                        email: String?,
                        phoneNumber: String?,
                        date: String?,
                        time: String?) {
    ui?.showLoading()
    interactor.save(data: FormInfo(fullName: fullName,
                                   email: email,
                                   phoneNumber: phoneNumber,
                                   date: date,
                                   time: time))
  }
}

extension DefaultFormPresenter: FormInteractorDelegate {
  func didLoad(time: String, date: String) {
    ui?.hideLoading()
    ui?.display(time: time, date: date)
  }
  
  func didFailLoadingDateAndTime(message: String) {
    ui?.hideLoading()
    ui?.showError(message: message)
  }
  
  func didSaveData(message: String) {
    ui?.hideLoading()
    ui?.showSuccess(message: message)
  }
  
  func didFailSavingData(error: String) {
    ui?.hideLoading()
    ui?.showError(message: error)
  }
}
