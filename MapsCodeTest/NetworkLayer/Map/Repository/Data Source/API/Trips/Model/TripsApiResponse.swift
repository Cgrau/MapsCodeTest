// MARK: - TripsApiResponse
typealias TripsApiResponse = [TripApiResponse]

// MARK: - TripApiResponse
struct TripApiResponse: Codable {
  let description, driverName, route, status: String?
  let origin: DestinationApiResponse?
  let stops: [TripStopApiResponse]?
  let destination: DestinationApiResponse?
  let endTime, startTime: String?
}

// MARK: - Destination
struct DestinationApiResponse: Codable {
  let address: String?
  let point: PointApiResponse?
}

// MARK: - Point
struct PointApiResponse: Codable {
  let latitude, longitude: Double?
  
  enum CodingKeys: String, CodingKey {
    case latitude = "_latitude"
    case longitude = "_longitude"
  }
}

// MARK: - Stop
struct TripStopApiResponse: Codable {
  let id: Int?
  let point: PointApiResponse?
}
