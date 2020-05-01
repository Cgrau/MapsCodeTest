import UIKit

protocol FormProvider {
  func formViewController() -> UIViewController
}

extension Assembly: FormProvider {
  func formViewController() -> UIViewController {
    let viewController = FormViewController()
    viewController.mainView = mainView
    let navigator = mainNavigator(from: viewController)
    let interactor = mainInteractor()
    let presenter = mainPresenter(from: viewController,
                                  navigator: navigator,
                                  interactor: interactor)
    
    viewController.presenter = presenter
    return viewController
  }
  
  private var mainView: FormView {
    return FormView()
  }
  
  private func mainPresenter(from: UIViewController,
                             navigator: FormNavigator,
                             interactor: FormInteractor) -> FormPresenter {
    let presenter = DefaultFormPresenter(interactor: interactor, navigator: navigator)
    interactor.delegate = presenter
    presenter.ui = from as? FormViewController
    
    return presenter
  }
  
  private func mainNavigator(from: UIViewController) -> FormNavigator {
    return DefaultFormNavigator(from: from)
  }
  
  private func mainInteractor() -> FormInteractor {
    return DefaultFormInteractor(localStorage: localStorage,
                                 timeAndDateProvider: timeAndDateProvider)
  }
  
  private var localStorage: LocalStorage {
    return UserDefaultsLocalStorage(userDefaults: UserDefaults.standard)
  }
  
  private var timeAndDateProvider: TimeAndDateProvider {
    return DefaultTimeAndDateProvider()
  }
}
