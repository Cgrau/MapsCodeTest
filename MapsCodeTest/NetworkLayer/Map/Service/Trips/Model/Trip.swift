import Foundation

// MARK: - Trip
public struct Trip: Codable {
  let description, driverName, route: String?
  let status: TripStatus?
  let origin: TripDestination?
  let stops: [TripStop]?
  let destination: TripDestination?
  let endTime, startTime: String?
}

// MARK: - Status
public enum TripStatus: String, Codable {
  case ongoing, scheduled, finalized, cancelled, none
}

// MARK: - Destination
public struct TripDestination: Codable {
  let address: String?
  let point: TripPoint?
}

// MARK: - Point
public struct TripPoint: Codable {
  let latitude, longitude: Double?
}

// MARK: - Stop
public struct TripStop: Codable {
  let id: Int?
  let point: TripPoint?
}
