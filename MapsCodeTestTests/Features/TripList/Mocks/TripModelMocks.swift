@testable import MapsCodeTest
import CoreLocation

extension Trip {
  static var mock: Trip {
    return Trip(description: "Description",
                driverName: "John Doe",
                route: "Route",
                status: .ongoing,
                origin: TripDestination(address: "origin",
                                        point: TripPoint.mock),
                stops: [TripStop.mock, TripStop.mock],
                destination: TripDestination(address: "destination",
                                             point: TripPoint.mock),
                startTime: "12:00",
                endTime: "13:00")
  }
  
  static var incompleteTrip: Trip {
    return Trip(description: nil,
                driverName: nil,
                route: nil,
                status: nil,
                origin: nil,
                stops: nil,
                destination: nil,
                startTime: nil,
                endTime: nil)
  }
}

extension TripPoint {
  static var mock: TripPoint {
    return TripPoint(longitude: 50.2,
                     latitude: -3.2)
  }
}

extension TripStop {
  static var mock: TripStop {
    return TripStop(id: 1,
                    point: TripPoint.mock)
  }
}

extension RoutePointAnnotation {
  static var mock: RoutePointAnnotation {
    return RoutePointAnnotation(latitude: -3.2,
                                longitude: 50.2)
  }
}
