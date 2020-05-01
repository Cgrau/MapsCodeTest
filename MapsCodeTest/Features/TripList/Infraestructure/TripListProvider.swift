import UIKit

protocol TripListProvider {
  func tripListViewController() -> UIViewController
}

extension Assembly: TripListProvider {
  func tripListViewController() -> UIViewController {
    let viewController = TripListViewController()
    let view = tripListContainerView()
    viewController.mainView = view
    let navigator = mainNavigator(from: viewController)
    let interactor = mainInteractor()
    let presenter = mainPresenter(from: viewController,
                                  navigator: navigator,
                                  interactor: interactor,
                                  view: view)
    
    viewController.presenter = presenter
    return viewController
  }
  
  private func mainPresenter(from: UIViewController,
                             navigator: TripListNavigator,
                             interactor: TripListInteractor,
                             view: UIView) -> TripListPresenter {
    let presenter = DefaultTripListPresenter(interactor: interactor,
                                             navigator: navigator)
    interactor.delegate = presenter
    presenter.ui = from as? TripListViewController
    
    return presenter
  }
  
  private func mainNavigator(from: UIViewController) -> TripListNavigator {
    return DefaultTripListNavigator(from: from,
                                    formProvider: self)
  }
  
  private func mainInteractor() -> TripListInteractor {
    return DefaultTripListInteractor(getTripsUseCase: resolver.getTrips,
                                     getStopUseCase: resolver.getStop)
  }
  
  private func tripListContainerView() -> TripListView {
    let containerView = TripListView()
    let provider = mapProvider
    containerView.setupProviders(mapProvider: provider,
                                 routeDrawable: routeDrawableProvider(with: provider),
                                 annotationDrawable: annotationDrawableProvider(with: provider),
                                 alertProvider: alertProvider(view: containerView))
    return containerView
  }
  
  private var mapProvider: MapProvider {
    return MapKitProvider()
  }
  
  private func routeDrawableProvider(with mapProvider: MapProvider) -> RouteDrawable {
    return MapKitRouteDrawable(mapProvider: mapProvider)
  }
  
  private func annotationDrawableProvider(with mapProvider: MapProvider) -> AnnotationDrawable {
    return MapKitAnnotationDrawable(mapProvider: mapProvider)
  }
  
  private func alertProvider(view: UIView) -> StopInfoAlertProvider {
    return DefaultStopInfoAlertProvider(view: view)
  }
}
