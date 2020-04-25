import Moya

//To avoid using MoyaProvider<Blabla> and using this the type is inferred
extension Assembly {
  func moya<T: TargetType>() -> MoyaProvider<T> {
    return MoyaProvider<T>()
  }
}
