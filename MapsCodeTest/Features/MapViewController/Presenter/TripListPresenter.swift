import UIKit

protocol TripListPresenter: class {
  var ui: TripListUI? { get set }
  
  func didLoad()
}
