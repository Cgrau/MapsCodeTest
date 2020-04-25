import XCTest

extension XCTestCase {
  var viewControllerFrame: CGRect {
    return CGRect(origin: .zero, size: CGSize(width: 375, height: 667))
  }
  
  var navigationBarFrame: CGRect {
    return CGRect(origin: .zero, size: CGSize(width: 750, height: 48))
  }
}
