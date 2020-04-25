import UIKit

class TripListViewController: UIViewController, TripListUI {
  
  var mainView: TripListView?
  
  var presenter: TripListPresenter?
  
  override func loadView() {
    mainView?.delegate = self
    view = mainView
  }
  
  func showTrips() {
    
  }
}

extension TripListViewController: TripListViewDelegate {
  
  func didTapButton() {
    //call presenter
  }
}
