import Foundation

protocol FieldValidator: AutoMockable {
  func validate(field: String?) -> Bool
}

class EmailValidator: FieldValidator {
  func validate(field: String?) -> Bool {
    guard let text = field else {
      return false
    }
    let format = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let predicate = NSPredicate(format: "SELF MATCHES %@", format)
    return predicate.evaluate(with: text) && !text.contains("..")
  }
}
