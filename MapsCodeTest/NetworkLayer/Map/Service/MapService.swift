import Moya

enum MapService: TargetType {
  case trips
}

extension MapService {
  var baseURL: URL {
    return Service.baseUrl
  }
  
  var path: String {
    return endpoint(for: self).path
  }
  
  var method: Moya.Method {
    return endpoint(for: self).method
  }
  
  var task: Task {
    return endpoint(for: self).task
  }
}

private func endpoint(for service: MapService) -> Endpoint {
  switch service {
  case .trips:
    return TripsEndpoint()
  }
}
