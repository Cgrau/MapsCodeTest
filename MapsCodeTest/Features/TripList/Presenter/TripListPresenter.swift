import UIKit

protocol TripListPresenter: class, AutoMockable {
  var ui: TripListUI? { get set }
  
  func didLoad()
}