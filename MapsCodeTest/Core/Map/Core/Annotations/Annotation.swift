import UIKit
import CoreLocation

protocol Annotation: class, AutoMockable {
  var coordinate: CLLocationCoordinate2D { get }
  var delegate: AnnotationDelegate? { get set }
  func didSelect()
  func didDeselect()
}

protocol AnnotationDelegate: class, AutoMockable {
  func annotationDidSelect(id: Int, coordinate: CLLocationCoordinate2D)
  func annotationDidDeselect()
}
