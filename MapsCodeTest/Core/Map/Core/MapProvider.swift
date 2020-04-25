import UIKit

protocol MapProvider: class, UIGestureRecognizerDelegate, AutoMockable {
  var mapView: UIView { get }
}
