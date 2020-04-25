import Moya

public struct PlainError: Error {
  public let message: String
  public let statusCode: Int
  public let internalCode: String
  
  public init(message: String,
              statusCode: Int,
              internalCode: String) {
    self.message = message
    self.statusCode = statusCode
    self.internalCode = internalCode
  }
  
  public static var mock: PlainError {
    return PlainError(message: "Mock error",
                      statusCode: 500,
                      internalCode: "040103")
  }
}

private enum Constants {
  static let defaultErrorMessage = ""
  static let defaultStatusCode = Int(0)
  static let defaultInternalCode = ""
}

struct PlainErrorAdapter: ErrorAdapter {
  func make(_ input: ErrorAdapter.Input, _ error: Error) throws -> Error {
    let errorMessage = message(for: error)
    let moyaError = error as? MoyaError
    let statusCode = moyaError?.response?.statusCode ?? Constants.defaultStatusCode
    let intCode = internalCode(for: error)
    throw PlainError(message: errorMessage,
                     statusCode: statusCode,
                     internalCode: intCode)
  }
  
  private func message(for error: Error) -> String {
    guard let json = mapJSON(from: error) else { return Constants.defaultErrorMessage }
    guard let message = json["message"] as? String else { return Constants.defaultErrorMessage }
    return message
  }
  
  private func internalCode(for error: Error) -> String {
    guard let json = mapJSON(from: error) else { return Constants.defaultInternalCode }
    guard let code = json["internal_code"] as? String else { return Constants.defaultInternalCode }
    return code
  }
  
  private func mapJSON(from error: Error) -> [AnyHashable: Any]? {
    guard let moyaError = error as? MoyaError else { return nil }
    do {
      guard let json = try moyaError.response?.mapJSON() as? [AnyHashable: Any] else { return nil }
      return json
    } catch { return nil }
  }
}
