public extension Error {
  var message: String {
    guard let error = self as? PlainError else { return localizedDescription }
    return error.message
  }
  
  var statusCode: Int {
    guard let error = self as? PlainError else { return 0 }
    return error.statusCode
  }
  
  var internalCode: String {
    guard let error = self as? PlainError else { return "" }
    return error.internalCode
  }
}
