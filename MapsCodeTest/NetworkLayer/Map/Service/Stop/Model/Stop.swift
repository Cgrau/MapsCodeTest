import Foundation

// MARK: - StopsAPIResponse
public struct Stop: Codable {
  let point: TripPoint
  let price: Double
  let stopTime: String
  let paid: Bool
  let address: String
  let tripID: Int
  let userName: String
  
  enum CodingKeys: String, CodingKey {
    case point, price, stopTime, paid, address
    case tripID = "tripId"
    case userName
  }
}
