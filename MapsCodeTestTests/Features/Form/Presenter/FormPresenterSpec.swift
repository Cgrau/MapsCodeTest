import XCTest
import CoreLocation
@testable import MapsCodeTest

final class FormPresenterSpec: XCTestCase {
  
  private var sut: DefaultFormPresenter!
  private var ui: FormUIMock!
  private var interactor: FormInteractorMock!
  private var navigator: FormNavigatorMock!
  
  override func setUp() {
    interactor = FormInteractorMock()
    navigator = FormNavigatorMock()
    ui = FormUIMock()
    sut = DefaultFormPresenter(interactor: interactor,
                               navigator: navigator)
    sut.ui = ui
  }
  
  func test_did_load() {
    sut.didLoad()
    XCTAssertTrue(ui.showLoadingCalled)
    XCTAssertTrue(interactor.getTimeAndDateCalled)
  }
  
  func test_closeButtonAction() {
    sut.closeButtonAction()
    XCTAssertTrue(navigator.dismissCalled)
  }
  
  func test_saveButtonAction() {
    sut.saveButtonAction(fullName: "",
                         email: "",
                         phoneNumber: "",
                         date: "",
                         time: "")
    XCTAssertTrue(ui.showLoadingCalled)
    XCTAssertTrue(interactor.saveDataCalled)
  }
  
  // MARK: FormInteractorDelegate
  func test_didLoadTimeAndDate() {
    sut.didLoad(time: "", date: "")
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.displayTimeDateCalled)
  }
  
  func test_didFailLoadingDateAndTimeMessage() {
    sut.didFailLoadingDateAndTime(message: "")
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showErrorMessageCalled)
  }
  
  func test_didSaveDataMessage() {
    sut.didSaveData(message: "")
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showSuccessMessageCalled)
  }
  
  func test_didFailSavingDataError() {
    sut.didFailSavingData(error: "")
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showErrorMessageCalled)
  }
}
