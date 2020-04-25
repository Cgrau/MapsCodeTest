import Moya

//To avoid using MoyaProvider<Blabla> and using this the type is inferred
extension NetworkAssembly {
  func moya<T: TargetType>() -> MoyaProvider<T> {
    return MoyaProvider<T>()
  }
}
