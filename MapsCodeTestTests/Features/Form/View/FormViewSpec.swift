import SnapshotTesting
import CoreLocation
import XCTest
@testable import MapsCodeTest

class FormViewSpec: XCTestCase {
  
  private var sut: FormView!
  
  override func setUp() {
    sut = formView()
  }
  
  func test_form_view_init_state() {
    assertSnapshot(matching: sut, as: .image)
  }
  
  func test_form_displayTimeDate() {
    sut.display(time: "10:30", date: "1/12/2020")
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
