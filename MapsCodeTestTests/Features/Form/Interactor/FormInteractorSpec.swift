import XCTest
import RxSwift
@testable import MapsCodeTest

final class FormInteractorSpec: XCTestCase {
  
  private var sut: DefaultFormInteractor!
  private var delegate: FormInteractorDelegateMock!
  private var localStorage: LocalStorageMock!
  private var timeAndDateProvider: TimeAndDateProviderMock!
  private var emailValidator: FieldValidatorMock!
  
  override func setUp() {
    localStorage = LocalStorageMock()
    timeAndDateProvider = TimeAndDateProviderMock()
    delegate = FormInteractorDelegateMock()
    emailValidator = FieldValidatorMock()
    sut = DefaultFormInteractor(localStorage: localStorage,
                                timeAndDateProvider: timeAndDateProvider,
                                emailValidator: emailValidator)
    sut.delegate = delegate
  }
  
  override func tearDown() {
    localStorage = nil
    timeAndDateProvider = nil
    delegate = nil
    sut = nil
  }
  
  func test_getTimeAndDate_OK() {
    givenTimeAndDate()
    sut.getTimeAndDate()
    XCTAssertFalse(delegate.didFailLoadingDateAndTimeMessageCalled)
    XCTAssertTrue(delegate.didLoadTimeDateCalled)
  }
  
  func test_getTimeAndDate_KO() {
    givenNilTimeAndDate()
    sut.getTimeAndDate()
    XCTAssertTrue(delegate.didFailLoadingDateAndTimeMessageCalled)
    XCTAssertFalse(delegate.didLoadTimeDateCalled)
  }
  
  func test_saveData_OK() {
    givenSavedItemsCount()
    givenValidEmail()
    sut.save(data: FormInfo.mock_OK)
    XCTAssertTrue(localStorage.storeValueCalled)
    XCTAssertTrue(delegate.didSaveDataMessageCalled)
    XCTAssertFalse(delegate.didFailSavingDataErrorCalled)
    XCTAssertTrue(delegate.displayCounterCalled)
  }
  
  func test_saveData_OK_phone_not_mandatory() {
    givenSavedItemsCount()
    givenValidEmail()
    sut.save(data: FormInfo.mock_OK_phone_nil)
    XCTAssertTrue(localStorage.storeValueCalled)
    XCTAssertTrue(delegate.didSaveDataMessageCalled)
    XCTAssertFalse(delegate.didFailSavingDataErrorCalled)
    XCTAssertTrue(delegate.displayCounterCalled)
  }
  
  func test_saveData_KO_all_nil() {
    givenInvalidEmail()
    sut.save(data: FormInfo.mock_KO_all_nil)
    XCTAssertFalse(localStorage.storeValueCalled)
    XCTAssertFalse(delegate.didSaveDataMessageCalled)
    XCTAssertTrue(delegate.didFailSavingDataErrorCalled)
    XCTAssertFalse(delegate.displayCounterCalled)
  }
  
  func test_saveData_KO_nil_email() {
    givenInvalidEmail()
    sut.save(data: FormInfo.mock_KO_nil_email)
    XCTAssertFalse(localStorage.storeValueCalled)
    XCTAssertFalse(delegate.didSaveDataMessageCalled)
    XCTAssertTrue(delegate.didFailSavingDataErrorCalled)
    XCTAssertFalse(delegate.displayCounterCalled)
  }
  
  func test_saveData_KO_invalid_email() {
    givenInvalidEmail()
    sut.save(data: FormInfo.mock_KO_invalidEmail)
    XCTAssertFalse(localStorage.storeValueCalled)
    XCTAssertFalse(delegate.didSaveDataMessageCalled)
    XCTAssertTrue(delegate.didFailSavingDataErrorCalled)
    XCTAssertFalse(delegate.displayCounterCalled)
  }
  
  func test_saveData_KO_empty_fields() {
    givenInvalidEmail()
    sut.save(data: FormInfo.mock_KO_empty_fields)
    XCTAssertFalse(localStorage.storeValueCalled)
    XCTAssertFalse(delegate.didSaveDataMessageCalled)
    XCTAssertTrue(delegate.didFailSavingDataErrorCalled)
    XCTAssertFalse(delegate.displayCounterCalled)
  }
  
  // MARK: Given
  func givenTimeAndDate() {
    timeAndDateProvider.currentTimeAndDateReturnValue = ("11:13", "10/10/2030")
  }
  
  func givenNilTimeAndDate() {
    timeAndDateProvider.currentTimeAndDateReturnValue = nil
  }
  
  func givenSavedItemsCount() {
    localStorage.getSavedItemsCountReturnValue = 1
  }
  
  func givenValidEmail() {
    emailValidator.validateFieldReturnValue = true
  }
  
  func givenInvalidEmail() {
    emailValidator.validateFieldReturnValue = false
  }
}
