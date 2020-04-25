import Moya
import Alamofire

struct TripsEndpoint: Endpoint {
  var path: String {
    return "/trips"
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var task: Task {
    return .requestPlain
  }
}
