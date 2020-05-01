import SnapshotTesting
import CoreLocation
import XCTest
@testable import MapsCodeTest

class FormViewSpec: XCTestCase {
  
  private var sut: FormView!
  
  override func setUp() {
    record = true
    sut = formView()
  }
  
  func test_form_view_init_state() {
    assertSnapshot(matching: sut, as: .image)
  }
  
  override func tearDown() {
    sut = nil
  }
}

extension FormViewSpec {
  private func formView() -> FormView {
    return FormView(frame: viewControllerFrame)
  }
}
