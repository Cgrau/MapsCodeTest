import UIKit
import CoreLocation

protocol Annotation: class, AutoMockable {
  var coordinate: CLLocationCoordinate2D { get }
  var delegate: AnnotationDelegate? { get set }
  func didSelect()
  func didDeselect()
  func annotationView() -> UIView?
  func selectedColor() -> UIColor
  func deselectedColor() -> UIColor
}

protocol AnnotationDelegate: class, AutoMockable {
  func annotationDidSelect(id: Int, coordinate: CLLocationCoordinate2D)
  func annotationDidDeselect()
}
