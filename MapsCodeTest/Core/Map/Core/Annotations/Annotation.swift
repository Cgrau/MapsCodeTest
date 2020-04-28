import UIKit
import CoreLocation

protocol Annotation: class, AutoMockable {
  var id: String? { get }
  var coordinate: CLLocationCoordinate2D { get }
}
