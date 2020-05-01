import XCTest
@testable import MapsCodeTest

private enum Email {
  /// "blabla@gmail.com"
  static let correctClassic = "blabla@gmail.com"
  /// "bla.bla@gmail.com"
  static let correctTwoLabels = "bla.bla@gmail.com"
  /// "bla.bla.bla@gmail.lol.com"
  static let correctTwoDotsLabel = "bla.bla.bla@gmail.lol.com"
  /// "bla.bla@gmail.lol.com"
  static let correctTwoDotsLabelAndDomain = "bla.bla@gmail.lol.com"
  /// "bla.bla@gmail..com"
  static let incorrectTwoDotsTogetherDomain = "bla.bla@gmail..com"
  /// "jean-claude.danest@external.chanel-corp.com"
  static let incorrectSuperlong = "jean-claude.danest@external.chanel-corp.com"
  /// "ewqeqwewq.cewqe.com"
  static let incorrectWithoutAtSign = "ewqeqwewq.cewqe.com"
  /// "ewqeqwewq@ewqe"
  static let incorrectWithoutDotCom = "ewqeqwewq@ewqe"
  /// "@ewqe.com"
  static let incorrectWithoutLabel = "@ewqe.com"
  /// "eqweqweqweqweqw"
  static let incorrectOnlyText = "eqweqweqweqweqw"
  /// "         "
  static let incorrectWhitespaces = "         "
  /// "john.doe+920@google.com"
  static let correctEmailWithPlusSign = "john.doe+920@google.com"
  /// ""
  static let empty = ""
}

class EmailValidatorTests: XCTestCase {
  private var sut: EmailValidator!
  private var email: String?
  private var isValid = false
  
  override func setUp() {
    super.setUp()
    sut = EmailValidator()
  }
  
  override func tearDown() {
    sut = nil
    email = nil
    isValid = false
    super.tearDown()
  }
  
  func test_valid_email() {
    given_correct_email()
    
    isValid = sut.validate(field: email)
    
    XCTAssertTrue(isValid)
  }
  
  func test_valid_email_with_two_dots_in_label() {
    given_correct_email_with_two_dots_in_label()
    
    isValid = sut.validate(field: email)
    
    XCTAssertTrue(isValid)
  }
  
  func test_valid_email_with_dot_on_label() {
    given_correct_email_with_dot_on_label()
    
    isValid = sut.validate(field: email)
    
    XCTAssertTrue(isValid)
  }
  
  func test_valid_email_with_two_dots_in_domain() {
    given_correct_email_with_two_dots_in_domain()
    
    isValid = sut.validate(field: email)
    
    XCTAssertTrue(isValid)
  }
  
  func test_invalid_email_with_two_dots_together_in_domain() {
    given_correct_email_with_two_dots_together_in_domain()
    
    isValid = sut.validate(field: email)
    
    XCTAssertFalse(isValid)
  }
  
  func test_valid_superlong_email() {
    given_correct_email_superlong()
    
    isValid = sut.validate(field: email)
    
    XCTAssertTrue(isValid)
  }
  
  func test_email_without_at_sign() {
    given_email_without_at_sign()
    
    isValid = sut.validate(field: email)
    
    XCTAssertFalse(isValid)
  }
  
  func test_email_without_dot_com() {
    given_email_without_dot_com()
    
    isValid = sut.validate(field: email)
    
    XCTAssertFalse(isValid)
  }
  
  func test_email_without_initial_part() {
    given_email_without_initial_part()
    
    isValid = sut.validate(field: email)
    
    XCTAssertFalse(isValid)
  }
  
  func test_incorrect_email() {
    given_incorrect_email()
    
    isValid = sut.validate(field: email)
    
    XCTAssertFalse(isValid)
  }
  
  func test_all_whitespaces() {
    given_all_whitespaces()
    
    isValid = sut.validate(field: email)
    
    XCTAssertFalse(isValid)
  }
  
  func test_email_with_plus_sign() {
    given_email_with_plus_sign()
    
    isValid = sut.validate(field: email)
    
    XCTAssertTrue(isValid)
  }
  
  func test_empty_email() {
    given_empty_email()
    
    isValid = sut.validate(field: email)
    
    XCTAssertFalse(isValid)
  }
  
  func test_nil_email() {
    given_nil_email()
    
    isValid = sut.validate(field: email)
    
    XCTAssertFalse(isValid)
  }
  
  //given
  private func given_correct_email() {
    email = Email.correctClassic
  }
  
  private func given_correct_email_with_dot_on_label() {
    email = Email.correctTwoLabels
  }
  
  private func given_correct_email_with_two_dots_in_label() {
    email = Email.correctTwoDotsLabel
  }
  
  private func given_correct_email_with_two_dots_in_domain() {
    email = Email.correctTwoDotsLabelAndDomain
  }
  
  private func given_correct_email_with_two_dots_together_in_domain() {
    email = Email.incorrectTwoDotsTogetherDomain
  }
  
  private func given_correct_email_superlong() {
    email = Email.incorrectSuperlong
  }
  
  private func given_email_without_at_sign() {
    email = Email.incorrectWithoutAtSign
  }
  
  private func given_email_without_dot_com() {
    email = Email.incorrectWithoutDotCom
  }
  
  private func given_email_without_initial_part() {
    email = Email.incorrectWithoutLabel
  }
  
  private func given_incorrect_email() {
    email = Email.incorrectOnlyText
  }
  
  private func given_all_whitespaces() {
    email = Email.incorrectWhitespaces
  }
  
  private func given_email_with_plus_sign() {
    email = Email.correctEmailWithPlusSign
  }
  
  private func given_empty_email() {
    email = Email.empty
  }
  
  private func given_nil_email() {
    email = nil
  }
}
