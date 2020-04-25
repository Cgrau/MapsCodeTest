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
  
  func show(errorMessage: String) {
    //show alert with error
  }
}

extension TripListViewController: TripListViewDelegate {
  
  func didTapButton() {
    //call presenter
  }
}
