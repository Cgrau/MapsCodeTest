import UIKit

class DefaultFormPresenter: FormPresenter {
  
  weak var ui: FormUI?
  private let interactor: FormInteractor
  private let navigator: FormNavigator
  private let badgeNumberUpdater: BadgeNumberUpdater
  
  init(interactor: FormInteractor,
       navigator: FormNavigator,
       badgeNumberUpdater: BadgeNumberUpdater) {
    self.interactor = interactor
    self.navigator = navigator
    self.badgeNumberUpdater = badgeNumberUpdater
  }
  
  func didLoad() {
    ui?.showLoading()
    interactor.getTimeAndDate()
  }
  
  func closeButtonAction() {
    navigator.dismiss()
  }
  
  func saveButtonAction(data: FormInfo) {
    ui?.showLoading()
    interactor.save(data: data)
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
    ui?.showSuccess(message: message, completion: {
      self.navigator.dismiss()
    })
  }
  
  func didFailSavingData(error: String) {
    ui?.hideLoading()
    ui?.showError(message: error)
  }
  
  func display(counter: Int) {
    badgeNumberUpdater.updateBadge(at: counter)
  }
}
