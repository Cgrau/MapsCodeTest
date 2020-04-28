import Foundation
import CoreLocation

// MARK: - Trip
public struct Trip {
  let description, driverName, route: String?
  let status: TripStatus?
  let origin: TripDestination?
  let stops: [TripStop]?
  let destination: TripDestination?
  let startTime, endTime: String?
}

// MARK: - Status
public enum TripStatus: String {
  case ongoing, scheduled, finalized, cancelled, none
}

// MARK: - Destination
public struct TripDestination {
  let address: String?
  let point: TripPoint?
}

// MARK: - Point
public struct TripPoint {
  let coordinates: CLLocationCoordinate2D?
}

// MARK: - Stop
public struct TripStop {
  let id: Int?
  let point: TripPoint?
}
