import UIKit

protocol MapProvider: class, UIGestureRecognizerDelegate {
  var mapView: UIView { get }
}
