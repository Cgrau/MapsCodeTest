import RxSwift

public protocol GetStopUseCase {
  func execute(request: StopRequest) -> Single<Stop>
}
