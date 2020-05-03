import MapKit

protocol AnnotationDrawable: class, AutoMockable {
  func add(annotations: [Annotation])
}
