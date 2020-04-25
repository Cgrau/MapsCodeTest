import Foundation

struct TripsApiToDomainMapper: Mappable {
  func map(data: Data?) -> [Trip]? {
    guard let data = data else {
      return nil
    }
    let jsonDecoder = JSONDecoder()
    do {
      return try decode(jsonDecoder: jsonDecoder, data: data)
    } catch  {
      return nil
    }
  }
  
  func map(_ from: TripsApiResponse) throws -> [Trip] {
    return from.map { (response: TripApiResponse) in
      return Trip(description: response.description,
                  driverName: response.driverName,
                  route: response.route,
                  status: TripStatus(rawValue: response.status ?? ""),
                  origin: map(destination: response.origin),
                  stops: map(stops: response.stops),
                  destination: map(destination: response.destination),
                  startTime: response.startTime?.mapToDateString(),
                  endTime: response.endTime?.mapToDateString())
    }
  }
  
  private func map(stops: [TripStopApiResponse]?) -> [TripStop]? {
    guard let stops = stops else { return nil }
    return stops.map({ TripStop(id: $0.id,
                                point: TripPoint(latitude: $0.point?.latitude,
                                                 longitude: $0.point?.longitude)) })
  }
  
  private func map(destination: DestinationApiResponse?) -> TripDestination? {
    guard let destination = destination else { return nil }
    return TripDestination(address: destination.address,
                           point: TripPoint(latitude: destination.point?.latitude,
                                            longitude: destination.point?.longitude))
  }
  
  private func decode(jsonDecoder: JSONDecoder, data: Data) throws -> [Trip] {
    let response = try jsonDecoder.decode(TripsApiResponse.self, from: data)
    return try map(response)
  }
}
