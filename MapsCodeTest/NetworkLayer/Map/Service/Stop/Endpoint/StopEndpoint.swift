import Moya
import Alamofire

struct StopEndpoint: Endpoint {
  private let request: StopRequest
  
  init(request: StopRequest) {
    self.request = request
  }
  
  var path: String {
    return "/stops/\(request.id)"
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var task: Task {
    return .requestPlain
  }
}
