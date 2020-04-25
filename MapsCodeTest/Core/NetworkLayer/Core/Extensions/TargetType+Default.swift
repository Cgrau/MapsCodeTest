import Moya

/*
 TargetType extension to apply default values for information that's not needed
 for our use case, we can override this values at any time from our endpoints
 */
extension TargetType {
  var sampleData: Data {
    return Data()
  }
  var headers: [String: String]? {
    return nil
  }
}
