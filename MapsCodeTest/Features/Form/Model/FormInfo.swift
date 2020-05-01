import Foundation

struct FormInfo: Codable {
  let fullName: String?
  let email: String?
  let phoneNumber: String?
  let date: String?
  let time: String?
  
  func toJsonString() -> String? {
    let jsonEncoder = JSONEncoder()
    guard let jsonData = try? jsonEncoder.encode(self) else { return nil }
    let json = String(data: jsonData, encoding: .utf8)
    return json
  }
}
