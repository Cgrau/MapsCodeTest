import XCTest
import RxSwift
@testable import MapsCodeTest

final class FormInteractorSpec: XCTestCase {
  
  private var sut: DefaultFormInteractor!
  private var delegate: FormInteractorDelegateMock!
  private var localStorage: LocalStorageMock!
  private var timeAndDateProvider: TimeAndDateProviderMock!
  
  override func setUp() {
    localStorage = LocalStorageMock()
    timeAndDateProvider = TimeAndDateProviderMock()
    delegate = FormInteractorDelegateMock()
    sut = DefaultFormInteractor(localStorage: localStorage,
                                timeAndDateProvider: timeAndDateProvider)
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
  
  func test_saveData_OK_1() {
    givenSavedItemsCount()
    sut.save(data: FormInfo.mock_OK_1)
    XCTAssertTrue(localStorage.storeValueCalled)
    XCTAssertTrue(delegate.didSaveDataMessageCalled)
    XCTAssertFalse(delegate.didFailSavingDataErrorCalled)
    XCTAssertTrue(delegate.displayCounterCalled)
  }
  
  func test_saveData_OK_2() {
    givenSavedItemsCount()
    sut.save(data: FormInfo.mock_OK_2)
    XCTAssertTrue(localStorage.storeValueCalled)
    XCTAssertTrue(delegate.didSaveDataMessageCalled)
    XCTAssertFalse(delegate.didFailSavingDataErrorCalled)
    XCTAssertTrue(delegate.displayCounterCalled)
  }
  
  func test_saveData_KO_1() {
    sut.save(data: FormInfo.mock_KO_1)
    XCTAssertFalse(localStorage.storeValueCalled)
    XCTAssertFalse(delegate.didSaveDataMessageCalled)
    XCTAssertTrue(delegate.didFailSavingDataErrorCalled)
    XCTAssertFalse(delegate.displayCounterCalled)
  }
  
  func test_saveData_KO_2() {
    sut.save(data: FormInfo.mock_KO_2)
    XCTAssertFalse(localStorage.storeValueCalled)
    XCTAssertFalse(delegate.didSaveDataMessageCalled)
    XCTAssertTrue(delegate.didFailSavingDataErrorCalled)
    XCTAssertFalse(delegate.displayCounterCalled)
  }
  
  func test_saveData_KO_3() {
    sut.save(data: FormInfo.mock_KO_3)
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
}

extension FormInfo {
  static var mock_OK_1: FormInfo {
    return FormInfo(fullName: "John Doe",
                    email: "johndoe@hotmail.com",
                    phoneNumber: "555555555",
                    date: "1/4/2050",
                    time: "10:30")
  }
  
  static var mock_OK_2: FormInfo {
    return FormInfo(fullName: "John Doe",
                    email: "johndoe@hotmail.com",
                    phoneNumber: nil,
                    date: "13/11/1987",
                    time: "11:00")
  }
  
  static var mock_KO_1: FormInfo {
    return FormInfo(fullName: nil,
                    email: nil,
                    phoneNumber: nil,
                    date: nil,
                    time: nil)
  }
  
  static var mock_KO_2: FormInfo {
    return FormInfo(fullName: "John Doe",
                    email: nil,
                    phoneNumber: "3123132132",
                    date: "1/4/2050",
                    time: "10:30")
  }
  
  static var mock_KO_3: FormInfo {
    return FormInfo(fullName: "",
                    email: "",
                    phoneNumber: "",
                    date: "1/4/2050",
                    time: "10:30")
  }
}
