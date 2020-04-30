import UIKit

class TripListViewController: UIViewController {
  
  var mainView: TripListView?
  
  var presenter: TripListPresenter?
  
  override func loadView() {
    mainView?.delegate = self
    view = mainView
  }
  
  override func viewDidLoad() {
    presenter?.didLoad()
  }
}

extension TripListViewController: TripListUI {
  func show(trips: [Trip]) {
    mainView?.trips = trips
  }
  
  func show(error: String) {
    show(errorMessage: error)
  }
  
  func showLoading() {
    showLoadingView()
  }
  
  func hideLoading() {
    hideLoadingView()
  }
  
  func show(route: String,
            driverName: String,
            description: String) {
    mainView?.draw(selectedRoute: route)
    mainView?.display(driverName: driverName,
                      description: description)
  }
  
  func add(points: [Annotation]) {
    mainView?.add(annotations: points)
  }
  
  func showStopInfo(userName: String,
                    address: String,
                    price: Double,
                    stopTime: String,
                    paid: Bool) {
    mainView?.showAlert(userName: userName,
                        address: address,
                        price: price,
                        stopTime: stopTime,
                        paid: paid)
  }
  
  func removeStopInfo() {
    mainView?.removeAlert()
  }
}

extension TripListViewController: TripListViewDelegate {
  func didTapOn(trip: Trip) {
    presenter?.select(trip: trip)
  }
}
